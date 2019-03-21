activityLog.subject.link=Pinned "{NOTE_NAME}"
activityLog.subject.new=Created new note "{NOTE_NAME}"
activityLog.error=Error occurred while creating an activity log

dialog.choice.ok=OK
dialog.choice.cancel=Cancel
dialog.title=Evernote for Salesforce

linkedNotes.error.cardMeta=Error while retrieving details on your pinned notes.
linkedNotes.error.copyNote.newBizTag=Error creating new business tag "{TAG_NAME}".
linkedNotes.error.copyNote.noteRetrieval=Error retrieving note contents.
linkedNotes.error.copyNote.personalTagsRetrieval=Error retrieving a personal tag.
linkedNotes.error.createNote.notebookRights=You do not have permission to write a new note to your selected notebook.
linkedNotes.error.createNote.failure=Error while creating a new note.
linkedNotes.error.link=Error while attempting to pin a note.
linkedNotes.error.linkCompletion=Could not finish pinning your note.
linkedNotes.error.sharing.failure=There was an error sharing the note with the business.
linkedNotes.error.tag.guid=Error while retrieving a tag by an id.
linkedNotes.error.tag.note=Error while retrieving note tags.
linkedNotes.error.tag.listRetrieval=Error retrieving list of tags.
linkedNotes.error.title.update=Error while updating title.
linkedNotes.error.unlink=Error while attempting to unpin a note.
linkedNotes.error.noViewing=You do not have permission to view this note.
linkedNotes.info.noteCopied=Your note has been copied to your default business notebook.
linkedNotes.note.none.header=No pinned notes yet
linkedNotes.note.none.instructions=Search for notes to pin to {RECORD_NAME}. Anyone who views this Salesforce record will see relevant information from Evernote.
linkedNotes.note.count={N_PLURAL:{N} note is|{N} notes are} pinned to {RECORD_NAME}
linkedNotes.warning.unlinking=You are about to unpin this note from {RECORD_NAME}. Continue?
linkedNotes.warning.noSharing=The owner of this note has not given you sharing rights. Users without access will not see the pinned note.

linkOptions.unlink=Unpin note
linkOptions.linkToOthers=Pin to other Salesforce records
linkOptions.otherRecords=Other records

notecard.link=Pin this note so that anyone can view it in Salesforce
notecard.unlink=Unpin note from {RECORD_NAME}

notice.error.blurb=You have encountered the following error:
notice.error.button.reauth=Reauthorize
notice.error.button.signIn=Sign in
notice.error.button.tryAgain=Try Again
notice.error.notEnoughHeight=Please notify your Salesforce administrator to set to the height of this Evernote Visualforce page to at least 480 pixels.
notice.error.reauthBlurb=If problems persist, try reauthorizing your connection to Evernote.
notice.error.title=We have encountered a problem
notice.initial.appIntro=New to Evernote? Learn more about Evernote for Salesforce.
notice.initial.blurb=Connect Evernote for Salesforce to launch projects with your team and keep your notes and records in one place.
notice.initial.button=Connect
notice.initial.title=One Workspace

operation.error.notFound=Salesforce record "{RECORD_NAME}" of type {RECORD_TYPE} is not found.

popup.error.blocker=Popup blocker detected. Please set your browser to allows popups from Salesforce.
popup.error.linkedNoteGuids=Could not get a list of pinned notes.
popup.error.noThrift=Sorry, an error occurred. Please reload this window.
popup.error.salesforceName=Could not get Salesforce record name.

relatedNotes.error.couldNotFind=Error finding related notes.
relatedNotes.note.notRelated=This note is not related
relatedNotes.status.none=No related notes found
relatedNotes.status.count=Showing {N_PLURAL:{N} related note|{N} related notes}

search.dropdown.business=Business
search.dropdown.personal=Personal
search.notes.error=There was an error searching for notes.
search.notes.none=No search results
search.notes.onlymine=Created by me
search.notes.withinJoinedNotebooks=Within joined notebooks
search.notes.allViewable=All viewable
search.notes.recent=Most recent notes
search.notes.found={N_PLURAL:{N} note|{N} notes} found
search.tips.intro=Search tips
search.tips.tip0=Search is case insensitive
search.tips.tip1=When searching with multiple words, only notes containing all the words will be found
search.tips.tip2=Use quotes for an exact match of all words -
search.tips.tip3=Use an asterisk at the end of a word for a wildcard search -
search.tips.tip4=Use <b>tag:</b> to search for notes by a tag. Can use a wildcard -
search.tips.tip5=Use <b>notebook:</b> to search for notes within a notebook. Exact match required -
search.tips.tip6=Use <b>intitle:</b> to search only the title -
search.tips.tip7=Use <b>author:</b> to search based on the author -
search.tips.tip8=Tips can be combined -
search.tips.example.tip2="Grapes of Wrath"
search.tips.example.tip3=mobile app*
search.tips.example.tip4=tag:super*, tag:superman
search.tips.example.tip5=notebook:"my notebook"
search.tips.example.tip6=intitle:chicken
search.tips.example.tip7=author:susan*, author:"susan carter"
search.tips.example.tip8=tag:super* mobile
search.wait=Searching...

sidemenu.nav.linkedNotes=View pinned notes
sidemenu.nav.newNote=Create new note
sidemenu.nav.relatedNotes=View related notes
sidemenu.nav.search=Search for notes
sidemenu.user.about=About Evernote for Salesforce
sidemenu.user.help=Help
sidemenu.user.defaultNotebook.error.noRecord=Trying to set default notebook. But user has no access token.
sidemenu.user.defaultNotebook.error.notebookUpdate=Error updating default notebook.
sidemenu.user.defaultNotebook.error.notebookRetrieval=There was an error retrieving notebooks.
sidemenu.user.defaultNotebook.instruction=Select new notebook:
sidemenu.user.defaultNotebook.menu=Change default notebook
sidemenu.user.defaultNotebook.noNotebook=Please select a default notebook
sidemenu.user.defaultNotebook.state=Your default notebook
sidemenu.user.defaultNotebook.explanation=When you create a new note, it will be saved automatically in this notebook.
sidemenu.user.disconnect.confirm=Are you sure you want to disconnect your Evernote account from Salesforce? You may reconnect at any time.
sidemenu.user.disconnect.menu=Disconnect Evernote
sidemenu.user.openEvernote=Open Evernote
sidemenu.user.version=Version {VERSION_NUMBER}

sso.proceed.disconnect=Not trying to log in with {EMAIL}? Disconnect Evernote
sso.proceed.failure=Try again
sso.proceed.initial=Proceed
sso.proceed.wait=Please wait
sso.title.failure=Single Sign In authentication failed. Try again?
sso.title.initial=Single Sign In is required to continue using Evernote for Salesforce.

timespan.count={N_PLURAL:{N} {TIMEUNIT:second|minute|hour|day|week}|{N} {TIMEUNIT:seconds|minutes|hours|days|weeks}} ago
timespan.lastWeek=Last week
timespan.moments=Moments ago
timespan.today=Today
timespan.yesterday=Yesterday

token.error.businessAccountRequired=You must use an Evernote Business account specified by your Salesforce administrator.
token.error.businessToken=Error while initiating a business authentication.
token.error.catchAll=An error occurred while trying to authenticate.
token.error.disabled=Your Evernote administrator has disabled Evernote for Salesforce.
token.error.invalidLongToken=Reconnect Evernote and Salesforce by signing in again.
token.error.legacySso=Legacy SSO Authentication failed.
token.error.missingLongToken=No Evernote connection exists. Please initiate your Evernote connection.
token.error.noRecordForStorePath=No user token exists but trying to update user store path.
token.error.popupSsoNoOpener=Your browser is preventing your required single sign on operation. Please change to a browser that supports window.opener.
token.error.sessionAuth=Failed to authenticate Evernote session.
token.error.serverError=Temporary server error. Please try again.
token.error.shortToken=Failed to initiate an Evernote token.
token.error.shortTokenCreate=Error while opening a new Evernote session.
token.error.userInfo=Could not retrieve your user information.
token.error.userUrls=Could not retrieve your user urls.
token.error.webResources=Failed to open a session to Evernote web resources.