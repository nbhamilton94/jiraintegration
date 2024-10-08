//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

public class JIRAIssueQueryJSON {

	public class Status {
		public String self;
		public String description;
		public String iconUrl;
		public String name;
		public String id;
		public StatusCategory statusCategory;
	}

	public class Assignee {
		public String self;
		public String accountId;
		public String emailAddress;
		public String displayName;
		public Boolean active;
		public String timeZone;
		public String accountType;
	}

	public class Priority {
		public String self;
		public String iconUrl;
		public String name;
		public String id;
	}

	public class Issues {
		public String expand;
		public String id;
		public String self;
		public String key;
		public Fields fields;
	}

	public class Aggregateprogress {
		public Integer progress;
		public Integer total;
	}

	public class Watches {
		public String self;
		public Integer watchCount;
		public Boolean isWatching;
	}

	public String expand;
	public Integer startAt;
	public Integer maxResults;
	public Integer total;
	public List<Issues> issues;

	public class Project {
		public String self;
		public String id;
		public String key;
		public String name;
		public String projectTypeKey;
		public Boolean simplified;
	}

	public class StatusCategory {
		public String self;
		public Integer id;
		public String key;
		public String colorName;
		public String name;
	}

	public class Fields {
		public String statuscategorychangedate;
		public Issuetype issuetype;
        public Integer aggregatetimespent;
        public Integer timespent;
		public Project project;
		public List<FixVersions> fixVersions;
		public Integer workratio;
		public String lastViewed;
		public Watches watches;
		public String created;
		public Priority priority;
		public List<FixVersions> labels;
		public Customfield_10018 customfield_10018;
		public String customfield_10019;
		public List<FixVersions> versions;
		public List<FixVersions> issuelinks;
		public Assignee assignee;
		public String updated;
		public Status status;
		public List<FixVersions> components;
		public String summary;
		public Assignee creator;
		public List<FixVersions> subtasks;
		public Assignee reporter;
		public Aggregateprogress aggregateprogress;
		public List<FixVersions> customfield_10002;
		public Aggregateprogress progress;
		public Votes votes;
	}

	public class NonEditableReason {
		public String reason;
		public String message;
	}

	public class FixVersions {
		public String self;
		public String id;
		public String description;
		public String name;
		public Boolean archived;
		public Boolean released;        
	}

	public class Customfield_10018 {
		public Boolean hasEpicLinkFieldDependency;
		public Boolean showField;
		public NonEditableReason nonEditableReason;
	}

	public class Issuetype {
		public String self;
		public String id;
		public String description;
		public String iconUrl;
		public String name;
		public Boolean subtask;
		public Integer avatarId;
		public Integer hierarchyLevel;
	}

	public class Votes {
		public String self;
		public Integer votes;
		public Boolean hasVoted;
	}

	
	public static JIRAIssueQueryJSON parse(String json) {
		return (JIRAIssueQueryJSON) System.JSON.deserialize(json, JIRAIssueQueryJSON.class);
	}
}