activityLog.subject.link=„{NOTE_NAME}“ angeheftet
activityLog.subject.new=Neue Notiz „{NOTE_NAME}“ erstellt
activityLog.error=Fehler beim Erstellen eines Aktivitätsprotokolls.

dialog.choice.ok=OK
dialog.choice.cancel=Abbrechen
dialog.title=Evernote für Salesforce

linkedNotes.error.cardMeta=Fehler beim Abruf von Details deiner angehefteten Notizen.
linkedNotes.error.copyNote.newBizTag=Fehler beim Erstellen des Schlagworts „{TAG_NAME}“ für ein Business-Konto.
linkedNotes.error.copyNote.noteRetrieval=Fehler beim Abruf von Inhalten einer Notiz.
linkedNotes.error.copyNote.personalTagsRetrieval=Fehler beim Abruf eines Schlagworts eines privaten Kontos.
linkedNotes.error.createNote.notebookRights=Du besitzt keine Berechtigung, um eine neue Notiz für das ausgewählte Notizbuch zu schreiben.
linkedNotes.error.createNote.failure=Fehler beim Erstellen einer neuen Notiz.
linkedNotes.error.link=Fehler beim Anheften einer Notiz.
linkedNotes.error.linkCompletion=Die Notiz konnte nicht fertig angeheftet werden.
linkedNotes.error.sharing.failure=Bei der Freigabe der Notiz für das Business-Konto kam es zu einem Fehler.
linkedNotes.error.tag.guid=Fehler beim Abruf eines Schlagworts nach einer ID.
linkedNotes.error.tag.note=Fehler beim Abruf der Schlagwörter einer Notiz.
linkedNotes.error.tag.listRetrieval=Fehler beim Abruf der Schlagwortliste.
linkedNotes.error.title.update=Fehler beim Aktualisieren des Titels.
linkedNotes.error.unlink=Fehler beim Versuch, eine angeheftete Notiz wieder zu lösen.
linkedNotes.error.noViewing=Du besitzt keine Berechtigung zur Ansicht dieser Notiz.
linkedNotes.info.noteCopied=Deine Notiz wurde in das Standardnotizbuch des Business-Kontos kopiert.
linkedNotes.note.none.header=Noch keine angehefteten Notizen
linkedNotes.note.none.instructions=Suche nach anzuheftenden Notizen für „{RECORD_NAME}“. Jedem Betrachter dieses Salesforce-Datensatzes werden dann relevante Inhalte aus Evernote präsentiert.
linkedNotes.note.count={N_PLURAL:{N} Notiz ist|{N} Notizen sind} an {RECORD_NAME} angeheftet
linkedNotes.warning.unlinking=Möchtest du diese angeheftete Notiz wirklich von „{RECORD_NAME}“ lösen?
linkedNotes.warning.noSharing=Der Besitzer dieser Notiz hat dir keine Berechtigung für die Freigabe erteilt. Nutzer ohne Zugriff können die angeheftete Notiz nicht sehen.

linkOptions.unlink=Angeheftete Notiz lösen
linkOptions.linkToOthers=An andere Salesforce-Datensätze anheften
linkOptions.otherRecords=Andere Datensätze

notecard.link=Hefte diese Notiz an, damit alle anderen sie in Salesforce sehen können
notecard.unlink=Angeheftete Notiz von „{RECORD_NAME}“ lösen

notice.error.blurb=Es ist folgender Fehler aufgetreten:
notice.error.button.reauth=Erneut autorisieren
notice.error.button.signIn=Anmelden
notice.error.button.tryAgain=Erneut versuchen
notice.error.notEnoughHeight=Bitte deinen Salesforce-Administrator darum, die Höhe dieser Evernote Visualforce-Seite auf mindestens 480 Pixel einzustellen.
notice.error.reauthBlurb=Sollte das Problem weiterhin bestehen, versuche, deine Verbindung zu Evernote erneut zu autorisieren.
notice.error.title=Es ist ein Problem aufgetreten
notice.initial.appIntro=Ist Evernote neu für dich? Erfahre mehr über Evernote für Salesforce.
notice.initial.blurb=Verknüpfe Evernote mit Salesforce, um Projekte mit deinem Team zu erarbeiten und dabei alle Notizen und Datensätze an einem zentralen Ort zu speichern.
notice.initial.button=Verbinden
notice.initial.title=Ein zentraler Arbeitsbereich

operation.error.notFound=Der Salesforce-Datensatz „{RECORD_NAME}“ vom Typ {RECORD_TYPE} konnte nicht gefunden werden.

popup.error.blocker=Es wurde ein Pop-up-Blocker entdeckt. Bitte konfiguriere deinen Browser so, dass Pop-up-Fenster von Salesforce zugelassen sind.
popup.error.linkedNoteGuids=Eine Liste angehefteter Notizen konnte nicht abgerufen werden.
popup.error.noThrift=Es ist ein Fehler aufgetreten. Bitte lade diese Seite neu.
popup.error.salesforceName=Der Name eines Salesforce-Datensatzes konnte nicht abgerufen werden.

relatedNotes.error.couldNotFind=Fehler bei der Suche nach verwandten Notizen.
relatedNotes.note.notRelated=Diese Notiz weist keinen Bezug auf.
relatedNotes.status.none=Keine zugehörigen Notizen gefunden
relatedNotes.status.count={N_PLURAL:{N} verwandte Notiz|{N} verwandte Notizen} angezeigt

search.dropdown.business=Business-Notizen
search.dropdown.personal=Private Notizen
search.notes.error=Fehler bei der Suche nach Notizen.
search.notes.none=Keine Suchergebnisse
search.notes.onlymine=Von mir erstellt
search.notes.withinJoinedNotebooks=In vernetzten Notizbüchern
search.notes.allViewable=Alle betrachtbaren
search.notes.recent=Letzte Notizen
search.notes.found={N_PLURAL:{N} Notiz|{N} Notizen} gefunden
search.tips.intro=Tipps zur Suche
search.tips.tip0=Die Suche unterscheidet zwischen Groß- und Kleinschreibung.
search.tips.tip1=Wenn du mehrere Suchbegriffe verwendest, werden nur Notizen gefunden, die alle Begriffe enthalten.
search.tips.tip2=Verwende Anführungszeichen, um exakt nach einer Wortfolge zu suchen.
search.tips.tip3=Verwende einen Stern (*) am Wortende als Platzhalter für die Suche.
search.tips.tip4=Verwende <b>tag:</b>, um Notizen nach einem Schlagwort zu durchsuchen. Hierbei sind Platzhalter zulässig.
search.tips.tip5=Verwende <b>notebook:</b>, um nach Notizen aus einem Notizbuch zu suchen. Hierbei ist eine exakte Übereinstimmung erforderlich.
search.tips.tip6=Verwende <b>intitle:</b>, um nur nach Treffern im Titel zu suchen.
search.tips.tip7=Verwende <b>author:</b>, um nach Notizen von einem bestimmten Autor zu suchen.
search.tips.tip8=Die Tipps können auch in Kombination angewendet werden.
search.tips.example.tip2=„Früchte des Zorns“
search.tips.example.tip3=mobile App*
search.tips.example.tip4=tag:Super*, tag:Superman
search.tips.example.tip5=notebook:"mein Notizbuch"
search.tips.example.tip6=intitle:Huhn
search.tips.example.tip7=author:Susan*, author:"Susan Carter"
search.tips.example.tip8=tag:Super* mobil
search.wait=Suchvorgang läuft…

sidemenu.nav.linkedNotes=Angeheftete Notizen anzeigen
sidemenu.nav.newNote=Neue Notiz erstellen
sidemenu.nav.relatedNotes=Verwandte Notizen anzeigen
sidemenu.nav.search=Nach Notizen suchen
sidemenu.user.about=Infos zu Evernote für Salesforce
sidemenu.user.help=Hilfe
sidemenu.user.defaultNotebook.error.noRecord=Nutzer hat keine Zugriffsberechtigung, um das Standardnotizbuch festzulegen.
sidemenu.user.defaultNotebook.error.notebookUpdate=Fehler beim Ändern des Standardnotizbuchs.
sidemenu.user.defaultNotebook.error.notebookRetrieval=Fehler beim Abruf von Notizbüchern.
sidemenu.user.defaultNotebook.instruction=Neues Notizbuch auswählen:
sidemenu.user.defaultNotebook.menu=Standardnotizbuch ändern
sidemenu.user.defaultNotebook.noNotebook=Bitte wähle ein Standardnotizbuch aus.
sidemenu.user.defaultNotebook.state=Dein Standardnotizbuch
sidemenu.user.defaultNotebook.explanation=Neu erstellte Notizen werden automatisch in diesem Notizbuch gespeichert.
sidemenu.user.disconnect.confirm=Möchtest du dein Evernote-Konto wirklich von Salesforce trennen? Du kannst die Anwendungen jederzeit wieder miteinander verknüpfen.
sidemenu.user.disconnect.menu=Evernote trennen
sidemenu.user.openEvernote=Evernote öffnen
sidemenu.user.version=Version {VERSION_NUMBER}

sso.proceed.disconnect=Du möchtest dich nicht mit {EMAIL} anmelden? Evernote trennen.
sso.proceed.failure=Erneut versuchen
sso.proceed.initial=Fortfahren
sso.proceed.wait=Bitte warten…
sso.title.failure=Die Bestätigung für das Single Sign-on schlug fehl. Erneut versuchen?
sso.title.initial=Um Evernote für Salesforce weiterhin nutzen zu können, ist eine Anmeldung per Single Sign-on erforderlich.

timespan.count=Vor {N_PLURAL:{N} {TIMEUNIT:Sekunde|Minute|Stunde|Tag|Woche}|{N} {TIMEUNIT:Sekunden|Minuten|Stunden|Tagen|Wochen}}
timespan.lastWeek=Letzte Woche
timespan.moments=Vor Kurzem
timespan.today=Heute
timespan.yesterday=Gestern

token.error.businessAccountRequired=Du musst ein Evernote Business-Konto verwenden, das von deinem Salesforce-Administrator festgelegt wurde.
token.error.businessToken=Fehler beim Initiieren der Authentifizierung für das Business-Konto.
token.error.catchAll=Fehler beim Authentifizierungsversuch.
token.error.disabled=Dein Evernote-Administrator hat Evernote für Salesforce deaktiviert.
token.error.invalidLongToken=Um Evernote wieder mit Salesforce zu verknüpfen, musst du dich erneut anmelden.
token.error.legacySso=Die alte Authentifizierung für das Single Sign-on ist fehlgeschlagen.
token.error.missingLongToken=Es besteht keine Verbindung zu Evernote. Bitte stelle eine Evernote-Verbindung her.
token.error.noRecordForStorePath=Es wurde ohne vorhandenes Nutzer-Token versucht, den Speicherpfad des Nutzers zu ändern.
token.error.popupSsoNoOpener=Dein Browser unterbindet den erforderlichen Vorgang für die Anmeldung per Single Sign-on. Bitte wechsle zu einem Browser, der die Funktion „window.opener“ unterstützt.
token.error.sessionAuth=Die Authentifizierung für die Evernote-Sitzung schlug fehl.
token.error.serverError=Vorübergehender Server-Fehler. Bitte versuche es erneut.
token.error.shortToken=Es konnte kein Evernote-Token initiiert werden.
token.error.shortTokenCreate=Fehler beim Öffnen einer neuen Evernote-Sitzung.
token.error.userInfo=Deine Nutzerinformationen konnten nicht abgerufen werden.
token.error.userUrls=Deine Nutzer-URLs konnten nicht abgerufen werden.
token.error.webResources=Es konnte keine Sitzung zu den Evernote-Webressourcen geöffnet werden.