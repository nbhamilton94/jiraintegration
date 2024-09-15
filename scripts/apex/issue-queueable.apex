//System.enqueueJob(new JIRAIssueQueueable(0, 0, 50, 0));

Map<String, String> params = new Map<String, String>();

params.put('jql', 'key=JOBS-2');

JIRAIssueHelper issues = new JIRAIssueHelper(params);
issues.getIssues();
issues.updateCases();