/*
 * CKFinder
 * ========
 * http://ckfinder.com
 * Copyright (C) 2007-2012, CKSource - Frederico Knabben. All rights reserved.
 *
 * The software, this file, and its contents are subject to the CKFinder
 * License. Please read the license.txt file before using, installing, copying,
 * modifying, or distributing this file or part of its contents. The contents of
 * this file is part of the Source Code of CKFinder.
 *
 */

/**
 * @fileOverview Defines the {@link CKFinder.lang} object for the Chinese (Taiwan)
 *		language.
 */

/**
 * Contains the dictionary of language entries.
 * @namespace
 */
CKFinder.lang['zh-tw'] =
{
	appTitle : 'CKFinder',

	// Common messages and labels.
	common :
	{
		// Put the voice-only part of the label in the span.
		unavailable		: '%1<span class="cke_accessibility">, unavailable</span>', // MISSING
		confirmCancel	: 'Some of the options were changed. Are you sure you want to close the dialog window?', // MISSING
		ok				: 'OK', // MISSING
		cancel			: 'Cancel', // MISSING
		confirmationTitle	: 'Confirmation', // MISSING
		messageTitle	: 'Information', // MISSING
		inputTitle		: 'Question', // MISSING
		undo			: 'Undo', // MISSING
		redo			: 'Redo', // MISSING
		skip			: 'Skip', // MISSING
		skipAll			: 'Skip all', // MISSING
		makeDecision	: 'What action should be taken?', // MISSING
		rememberDecision: 'Remember my decision' // MISSING
	},


	// Language direction, 'ltr' or 'rtl'.
	dir : 'ltr',
	HelpLang : 'zh-tw',
	LangCode : 'zh-tw',

	// Date Format
	//		d    : Day
	//		dd   : Day (padding zero)
	//		m    : Month
	//		mm   : Month (padding zero)
	//		yy   : Year (two digits)
	//		yyyy : Year (four digits)
	//		h    : Hour (12 hour clock)
	//		hh   : Hour (12 hour clock, padding zero)
	//		H    : Hour (24 hour clock)
	//		HH   : Hour (24 hour clock, padding zero)
	//		M    : Minute
	//		MM   : Minute (padding zero)
	//		a    : Firt char of AM/PM
	//		aa   : AM/PM
	DateTime : 'mm/dd/yyyy HH:MM',
	DateAmPm : ['上午', '下午'],

	// Folders
	FoldersTitle	: '目錄',
	FolderLoading	: '載入中...',
	FolderNew		: '請輸入新目錄名稱: ',
	FolderRename	: '請輸入新目錄名稱: ',
	FolderDelete	: '確定刪除 "%1" 這個目錄嗎?',
	FolderRenaming	: ' (修改目錄...)',
	FolderDeleting	: ' (刪除目錄...)',
	DestinationFolder	: 'Destination Folder', // MISSING

	// Files
	FileRename		: '請輸入新檔案名稱: ',
	FileRenameExt	: '確定變更這個檔案的副檔名嗎? 變更後 , 此檔案可能會無法使用 !',
	FileRenaming	: '修改檔案名稱...',
	FileDelete		: '確定要刪除這個檔案 "%1"?',
	FilesDelete	: 'Are you sure you want to delete %1 files?', // MISSING
	FilesLoading	: '載入中...',
	FilesEmpty		: 'The folder is empty.', // MISSING
	DestinationFile	: 'Destination File', // MISSING
	SkippedFiles	: 'List of skipped files:', // MISSING

	// Basket
	BasketFolder		: 'Basket', // MISSING
	BasketClear			: 'Clear Basket', // MISSING
	BasketRemove		: 'Remove from Basket', // MISSING
	BasketOpenFolder	: 'Open Parent Folder', // MISSING
	BasketTruncateConfirm : 'Do you really want to remove all files from the basket?', // MISSING
	BasketRemoveConfirm	: 'Do you really want to remove the file "%1" from the basket?', // MISSING
	BasketRemoveConfirmMultiple	: 'Do you really want to remove %1 files from the basket?', // MISSING
	BasketEmpty			: 'No files in the basket, drag and drop some.', // MISSING
	BasketCopyFilesHere	: 'Copy Files from Basket', // MISSING
	BasketMoveFilesHere	: 'Move Files from Basket', // MISSING

	// Global messages
	OperationCompletedSuccess	: 'Operation completed successfully.', // MISSING
	OperationCompletedErrors		: 'Operation completed with errors.', // MISSING
	FileError				: '%s: %e', // MISSING

	// Move and Copy files
	MovedFilesNumber		: 'Number of files moved: %s.', // MISSING
	CopiedFilesNumber	: 'Number of files copied: %s.', // MISSING
	MoveFailedList		: 'The following files could not be moved:<br />%s', // MISSING
	CopyFailedList		: 'The following files could not be copied:<br />%s', // MISSING

	// Toolbar Buttons (some used elsewhere)
	Upload		: '上傳檔案',
	UploadTip	: '上傳一個新檔案',
	Refresh		: '重新整理',
	Settings	: '偏好設定',
	Help		: '說明',
	HelpTip		: '說明',

	// Context Menus
	Select			: '選擇',
	SelectThumbnail : 'Select Thumbnail', // MISSING
	View			: '瀏覽',
	Download		: '下載',

	NewSubFolder	: '建立新子目錄',
	Rename			: '重新命名',
	Delete			: '刪除',
	DeleteFiles		: 'Delete Files', // MISSING

	CopyDragDrop	: 'Copy Here', // MISSING
	MoveDragDrop	: 'Move Here', // MISSING

	// Dialogs
	RenameDlgTitle		: 'Rename', // MISSING
	NewNameDlgTitle		: 'New Name', // MISSING
	FileExistsDlgTitle	: 'File Already Exists', // MISSING
	SysErrorDlgTitle : 'System Error', // MISSING

	FileOverwrite	: 'Overwrite', // MISSING
	FileAutorename	: 'Auto-rename', // MISSING
	ManuallyRename	: 'Manually rename', // MISSING

	// Generic
	OkBtn		: '確定',
	CancelBtn	: '取消',
	CloseBtn	: '關閉',

	// Upload Panel
	UploadTitle			: '上傳新檔案',
	UploadSelectLbl		: '請選擇要上傳的檔案',
	UploadProgressLbl	: '(檔案上傳中 , 請稍候...)',
	UploadBtn			: '將檔案上傳到伺服器',
	UploadBtnCancel		: '取消',

	UploadNoFileMsg		: '請從你的電腦選擇一個檔案.',
	UploadNoFolder		: 'Please select a folder before uploading.', // MISSING
	UploadNoPerms		: 'File upload not allowed.', // MISSING
	UploadUnknError		: 'Error sending the file.', // MISSING
	UploadExtIncorrect	: 'File extension not allowed in this folder.', // MISSING

	// Flash Uploads
	UploadLabel			: 'Files to Upload', // MISSING
	UploadTotalFiles	: 'Total Files:', // MISSING
	UploadTotalSize		: 'Total Size:', // MISSING
	UploadSend			: '上傳檔案',
	UploadAddFiles		: 'Add Files', // MISSING
	UploadClearFiles	: 'Clear Files', // MISSING
	UploadCancel		: 'Cancel Upload', // MISSING
	UploadRemove		: 'Remove', // MISSING
	UploadRemoveTip		: 'Remove !f', // MISSING
	UploadUploaded		: 'Uploaded !n%', // MISSING
	UploadProcessing	: 'Processing...', // MISSING

	// Settings Panel
	SetTitle		: '設定',
	SetView			: '瀏覽方式:',
	SetViewThumb	: '縮圖預覽',
	SetViewList		: '清單列表',
	SetDisplay		: '顯示欄位:',
	SetDisplayName	: '檔案名稱',
	SetDisplayDate	: '檔案日期',
	SetDisplaySize	: '檔案大小',
	SetSort			: '排序方式:',
	SetSortName		: '依 檔案名稱',
	SetSortDate		: '依 檔案日期',
	SetSortSize		: '依 檔案大小',
	SetSortExtension		: 'by Extension', // MISSING

	// Status Bar
	FilesCountEmpty : '<此目錄沒有任何檔案>',
	FilesCountOne	: '1 個檔案',
	FilesCountMany	: '%1 個檔案',

	// Size and Speed
	Kb				: '%1 KB',
	Mb				: '%1 MB', // MISSING
	Gb				: '%1 GB', // MISSING
	SizePerSecond	: '%1/s', // MISSING

	// Connector Error Messages.
	ErrorUnknown	: '無法連接到伺服器 ! (錯誤代碼 %1)',
	Errors :
	{
	 10 : '不合法的指令.',
	 11 : '連接過程中 , 未指定資源形態 !',
	 12 : '連接過程中出現不合法的資源形態 !',
	102 : '不合法的檔案或目錄名稱 !',
	103 : '無法連接：可能是使用者權限設定錯誤 !',
	104 : '無法連接：可能是伺服器檔案權限設定錯誤 !',
	105 : '無法上傳：不合法的副檔名 !',
	109 : '不合法的請求 !',
	110 : '不明錯誤 !',
	111 : 'It was not possible to complete the request due to resulting file size.', // MISSING
	115 : '檔案或目錄名稱重複 !',
	116 : '找不到目錄 ! 請先重新整理 , 然後再試一次 !',
	117 : '找不到檔案 ! 請先重新整理 , 然後再試一次 !',
	118 : 'Source and target paths are equal.', // MISSING
	201 : '伺服器上已有相同的檔案名稱 ! 您上傳的檔案名稱將會自動更改為 "%1".',
	202 : '不合法的檔案 !',
	203 : '不合法的檔案 ! 檔案大小超過預設值 !',
	204 : '您上傳的檔案已經損毀 !',
	205 : '伺服器上沒有預設的暫存目錄 !',
	206 : '檔案上傳程序因為安全因素已被系統自動取消 ! 可能是上傳的檔案內容包含 HTML 碼 !',
	207 : '您上傳的檔案名稱將會自動更改為 "%1".',
	300 : 'Moving file(s) failed.', // MISSING
	301 : 'Copying file(s) failed.', // MISSING
	500 : '因為安全因素 , 檔案瀏覽器已被停用 ! 請聯絡您的系統管理者並檢查 CKFinder 的設定檔 config.php !',
	501 : '縮圖預覽功能已被停用 !'
	},

	// Other Error Messages.
	ErrorMsg :
	{
		FileEmpty		: '檔案名稱不能空白 !',
		FileExists		: 'File %s already exists.', // MISSING
		FolderEmpty		: '目錄名稱不能空白 !',
		FolderExists	: 'Folder %s already exists.', // MISSING
		FolderNameExists	: 'Folder already exists.', // MISSING

		FileInvChar		: '檔案名稱不能包含以下字元： \n\\ / : * ? " < > |',
		FolderInvChar	: '目錄名稱不能包含以下字元： \n\\ / : * ? " < > |',

		PopupBlockView	: '無法在新視窗開啟檔案 ! 請檢查瀏覽器的設定並且針對這個網站 關閉 <封鎖彈跳視窗> 這個功能 !',
		XmlError		: 'It was not possible to properly load the XML response from the web server.', // MISSING
		XmlEmpty		: 'It was not possible to load the XML response from the web server. The server returned an empty response.', // MISSING
		XmlRawResponse	: 'Raw response from the server: %s' // MISSING
	},

	// Imageresize plugin
	Imageresize :
	{
		dialogTitle		: 'Resize %s', // MISSING
		sizeTooBig		: 'Cannot set image height or width to a value bigger than the original size (%size).', // MISSING
		resizeSuccess	: 'Image resized successfully.', // MISSING
		thumbnailNew	: 'Create a new thumbnail', // MISSING
		thumbnailSmall	: 'Small (%s)', // MISSING
		thumbnailMedium	: 'Medium (%s)', // MISSING
		thumbnailLarge	: 'Large (%s)', // MISSING
		newSize			: 'Set a new size', // MISSING
		width			: 'Width', // MISSING
		height			: 'Height', // MISSING
		invalidHeight	: 'Invalid height.', // MISSING
		invalidWidth	: 'Invalid width.', // MISSING
		invalidName		: 'Invalid file name.', // MISSING
		newImage		: 'Create a new image', // MISSING
		noExtensionChange : 'File extension cannot be changed.', // MISSING
		imageSmall		: 'Source image is too small.', // MISSING
		contextMenuName	: 'Resize', // MISSING
		lockRatio		: 'Lock ratio', // MISSING
		resetSize		: 'Reset size' // MISSING
	},

	// Fileeditor plugin
	Fileeditor :
	{
		save			: 'Save', // MISSING
		fileOpenError	: 'Unable to open file.', // MISSING
		fileSaveSuccess	: 'File saved successfully.', // MISSING
		contextMenuName	: 'Edit', // MISSING
		loadingFile		: 'Loading file, please wait...' // MISSING
	},

	Maximize :
	{
		maximize : 'Maximize', // MISSING
		minimize : 'Minimize' // MISSING
	},

	Gallery :
	{
		current : 'Image {current} of {total}' // MISSING
	},

	Zip :
	{
		extractHereLabel	: 'Extract here', // MISSING
		extractToLabel		: 'Extract to...', // MISSING
		downloadZipLabel	: 'Download as zip', // MISSING
		compressZipLabel	: 'Compress to zip', // MISSING
		removeAndExtract	: 'Remove existing and extract', // MISSING
		extractAndOverwrite	: 'Extract overwriting existing files', // MISSING
		extractSuccess		: 'File extracted successfully.' // MISSING
	}
};
