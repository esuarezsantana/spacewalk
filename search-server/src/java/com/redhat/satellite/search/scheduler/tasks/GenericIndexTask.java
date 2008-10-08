/**
 * Copyright (c) 2008 Red Hat, Inc.
 *
 * This software is licensed to you under the GNU General Public License,
 * version 2 (GPLv2). There is NO WARRANTY for this software, express or
 * implied, including the implied warranties of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
 * along with this software; if not, see
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
 *
 * Red Hat trademarks are not licensed under GPLv2. No permission is
 * granted to use or replicate Red Hat trademarks that are incorporated
 * in this software or its documentation.
 */
package com.redhat.satellite.search.scheduler.tasks;

import com.redhat.satellite.search.db.DatabaseManager;
import com.redhat.satellite.search.db.Query;
import com.redhat.satellite.search.db.WriteQuery;
import com.redhat.satellite.search.db.models.GenericRecord;
import com.redhat.satellite.search.index.IndexManager;
import com.redhat.satellite.search.index.IndexingException;
import com.redhat.satellite.search.index.builder.BuilderFactory;
import com.redhat.satellite.search.index.builder.DocumentBuilder;

import org.apache.log4j.Logger;
import org.apache.lucene.document.Document;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.sql.SQLException;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * GenericIndexTask
 * @version $Rev$
 */
public abstract class GenericIndexTask implements Job {

    private static Logger log = Logger.getLogger(GenericIndexTask.class);
    /**
     * {@inheritDoc}
     */
    public void execute(JobExecutionContext ctx)
        throws JobExecutionException {
        JobDataMap jobData = ctx.getJobDetail().getJobDataMap();
        DatabaseManager databaseManager =
            (DatabaseManager)jobData.get("databaseManager");
        IndexManager indexManager =
            (IndexManager)jobData.get("indexManager");

        try {
            List<GenericRecord> data = getRecords(databaseManager);
            int count = 0;
            log.info(super.getClass().toString() + "found [" +
                    data.size() + "] items to index");
            for (Iterator<GenericRecord> iter = data.iterator(); iter.hasNext();) {
                GenericRecord current = iter.next();
                indexRecord(indexManager, current);
                count++;
                if (count == 10 || !iter.hasNext()) {
                    if (System.getProperties().get("isTesting") == null) {
                        updateLastRecord(databaseManager, current.getId());
                    }
                    count = 0;
                }
            }
        }
        catch (SQLException e) {
            throw new JobExecutionException(e);
        }
        catch (IndexingException e) {
            throw new JobExecutionException(e);
        }
    }
    /**
     * @param databaseManager
     * @param sid
     */
    private void updateLastRecord(DatabaseManager databaseManager, long sid)
        throws SQLException {

        WriteQuery updateQuery = databaseManager.getWriterQuery(getQueryUpdateLastRecord());
        WriteQuery insertQuery = databaseManager.getWriterQuery(getQueryCreateLastRecord());

        try {
            Map params = new HashMap();
            params.put("id", sid);
            params.put("last_modified", Calendar.getInstance().getTime());

            if (updateQuery.update(params) == 0) {
                insertQuery.insert(params);
            }
        }
        finally {
            try {
                if (updateQuery != null) {
                    updateQuery.close();
                }
            }
            finally {
                if (insertQuery != null) {
                    insertQuery.close();
                }
            }
        }
    }

    /**
     * @param indexManager
     * @param current
     */
    private void indexRecord(IndexManager indexManager,
            GenericRecord data)
        throws IndexingException {

        Map<String, String> attrs = getFieldMap(data);
        log.info(super.getClass().toString() + " Indexing object: " +
                data.getId() + ": " + attrs.toString());
        DocumentBuilder pdb = BuilderFactory.getBuilder(getIndexName());
        Document doc = pdb.buildDocument(new Long(data.getId()), attrs);
        indexManager.addUniqueToIndex(getIndexName(), doc, getUniqueFieldId());
    }


    /**
     * @param databaseManager
     * @return
     */
    private List<GenericRecord> getRecords(DatabaseManager databaseManager)
        throws SQLException {
        // What was the last object id we indexed?
        List<GenericRecord> retval = null;
        Query<Long> query = databaseManager.getQuery(getQueryLastRecord());
        Long sid = null;
        try {
            sid = query.load();
        }
        finally {
            query.close();
        }
        if (sid == null) {
            sid = new Long(0);
        }
        // When was the last time we ran the indexing of servers?
        Query<Date> queryLast = databaseManager.getQuery(getQueryLastIndexDate());
        Date lastRun = null;
        try {
            lastRun = queryLast.load();
        }
        finally {
            queryLast.close();
        }
        if (lastRun == null) {
            lastRun = new Date(0);
        }
        // Lookup what objects have not been indexed, or need to be reindexed.
        Query<GenericRecord> srvrQuery = databaseManager.getQuery(
                getQueryRecordsToIndex());
        try {
            Map params = new HashMap();
            params.put("id", sid);
            params.put("last_modified", lastRun);
            retval = srvrQuery.loadList(params);
        }
        finally {
            srvrQuery.close();
        }
        return retval;
    }


    /**
     *
     * @param data fully populated DTO object
     * @return map which represents the fields to index along with their values
     * @throws ClassCastException when data isn't castable to the intended DTO
     */
    protected abstract Map<String, String> getFieldMap(GenericRecord data)
        throws ClassCastException;
    /**
     *
     * @return the index name
     */
    public abstract String getIndexName();
    /**
     * @return the Document field name which represents the unique id for this data
     */
    public abstract String getUniqueFieldId();
    /**
     *
     * @return name of query which shows the last record indexed
     */
    protected abstract String getQueryLastRecord();
    /**
     *
     * @return name of query which will update the last record indexed
     */
    protected abstract String getQueryUpdateLastRecord();
    /**
     *
     * @return name of query which will create the last record indexed
     */
    protected abstract String getQueryCreateLastRecord();
    /**
     *
     * @return name of query which will give back records to be indexed
     */
    protected abstract String getQueryRecordsToIndex();
    /**
     *
     * @return name of query which will show the date this task last ran
     */
    protected abstract String getQueryLastIndexDate();


}
