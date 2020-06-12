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
	DateAmPm : ['����', '����'],

	// Folders
	FoldersTitle	: 'Ŀ�',
	FolderLoading	: '�d����...',
	FolderNew		: 'Ոݔ����Ŀ����Q: ',
	FolderRename	: 'Ոݔ����Ŀ����Q: ',
	FolderDelete	: '�_���h�� "%1" �@��Ŀ䛆�?',
	FolderRenaming	: ' (�޸�Ŀ�...)',
	FolderDeleting	: ' (�h��Ŀ�...)',
	DestinationFolder	: 'Destination Folder', // MISSING

	// Files
	FileRename		: 'Ոݔ���n�����Q: ',
	FileRenameExt	: '�_��׃���@���n���ĸ��n����? ׃���� , �˙n�����ܕ��o��ʹ�� !',
	FileRenaming	: '�޸ęn�����Q...',
	FileDelete		: '�_��Ҫ�h���@���n�� "%1"?',
	FilesDelete	: 'Are you sure you want to delete %1 files?', // MISSING
	FilesLoading	: '�d����...',
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
	Upload		: '�ς��n��',
	UploadTip	: '�ς�һ���n��',
	Refresh		: '��������',
	Settings	: 'ƫ���O��',
	Help		: '�f��',
	HelpTip		: '�f��',

	// Context Menus
	Select			: '�x��',
	SelectThumbnail : 'Select Thumbnail', // MISSING
	View			: '�g�[',
	Download		: '���d',

	NewSubFolder	: '��������Ŀ�',
	Rename			: '��������',
	Delete			: '�h��',
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
	OkBtn		: '�_��',
	CancelBtn	: 'ȡ��',
	CloseBtn	: '�P�]',

	// Upload Panel
	UploadTitle			: '�ς��n��',
	UploadSelectLbl		: 'Ո�x��Ҫ�ς��ęn��',
	UploadProgressLbl	: '(�n���ς��� , Ո�Ժ�...)',
	UploadBtn			: '���n���ς����ŷ���',
	UploadBtnCancel		: 'ȡ��',

	UploadNoFileMsg		: 'Ո�������X�x��һ���n��.',
	UploadNoFolder		: 'Please select a folder before uploading.', // MISSING
	UploadNoPerms		: 'File upload not allowed.', // MISSING
	UploadUnknError		: 'Error sending the file.', // MISSING
	UploadExtIncorrect	: 'File extension not allowed in this folder.', // MISSING

	// Flash Uploads
	UploadLabel			: 'Files to Upload', // MISSING
	UploadTotalFiles	: 'Total Files:', // MISSING
	UploadTotalSize		: 'Total Size:', // MISSING
	UploadSend			: '�ς��n��',
	UploadAddFiles		: 'Add Files', // MISSING
	UploadClearFiles	: 'Clear Files', // MISSING
	UploadCancel		: 'Cancel Upload', // MISSING
	UploadRemove		: 'Remove', // MISSING
	UploadRemoveTip		: 'Remove !f', // MISSING
	UploadUploaded		: 'Uploaded !n%', // MISSING
	UploadProcessing	: 'Processing...', // MISSING

	// Settings Panel
	SetTitle		: '�O��',
	SetView			: '�g�[��ʽ:',
	SetViewThumb	: '�s�D�A�[',
	SetViewList		: '����б�',
	SetDisplay		: '�@ʾ��λ:',
	SetDisplayName	: '�n�����Q',
	SetDisplayDate	: '�n������',
	SetDisplaySize	: '�n����С',
	SetSort			: '����ʽ:',
	SetSortName		: '�� �n�����Q',
	SetSortDate		: '�� �n������',
	SetSortSize		: '�� �n����С',
	SetSortExtension		: 'by Extension', // MISSING

	// Status Bar
	FilesCountEmpty : '<��Ŀ䛛]���κΙn��>',
	FilesCountOne	: '1 ���n��',
	FilesCountMany	: '%1 ���n��',

	// Size and Speed
	Kb				: '%1 KB',
	Mb				: '%1 MB', // MISSING
	Gb				: '%1 GB', // MISSING
	SizePerSecond	: '%1/s', // MISSING

	// Connector Error Messages.
	ErrorUnknown	: '�o���B�ӵ��ŷ��� ! (�e�`���a %1)',
	Errors :
	{
	 10 : '���Ϸ���ָ��.',
	 11 : '�B���^���� , δָ���YԴ�ΑB !',
	 12 : '�B���^���г��F���Ϸ����YԴ�ΑB !',
	102 : '���Ϸ��ęn����Ŀ����Q !',
	103 : '�o���B�ӣ�������ʹ���ߙ����O���e�` !',
	104 : '�o���B�ӣ��������ŷ����n�������O���e�` !',
	105 : '�o���ς������Ϸ��ĸ��n�� !',
	109 : '���Ϸ���Ո�� !',
	110 : '�����e�` !',
	111 : 'It was not possible to complete the request due to resulting file size.', // MISSING
	115 : '�n����Ŀ����Q���} !',
	116 : '�Ҳ���Ŀ� ! Ո���������� , Ȼ����ԇһ�� !',
	117 : '�Ҳ����n�� ! Ո���������� , Ȼ����ԇһ�� !',
	118 : 'Source and target paths are equal.', // MISSING
	201 : '�ŷ�����������ͬ�ęn�����Q ! ���ς��ęn�����Q�����ԄӸ��Ğ� "%1".',
	202 : '���Ϸ��ęn�� !',
	203 : '���Ϸ��ęn�� ! �n����С���^�A�Oֵ !',
	204 : '���ς��ęn���ѽ��p�� !',
	205 : '�ŷ����ϛ]���A�O�ĕ���Ŀ� !',
	206 : '�n���ς�������鰲ȫ�����ѱ�ϵ�y�Ԅ�ȡ�� ! �������ς��ęn�����ݰ��� HTML �a !',
	207 : '���ς��ęn�����Q�����ԄӸ��Ğ� "%1".',
	300 : 'Moving file(s) failed.', // MISSING
	301 : 'Copying file(s) failed.', // MISSING
	500 : '��鰲ȫ���� , �n���g�[���ѱ�ͣ�� ! Ո�j����ϵ�y�����߁K�z�� CKFinder ���O���n config.php !',
	501 : '�s�D�A�[�����ѱ�ͣ�� !'
	},

	// Other Error Messages.
	ErrorMsg :
	{
		FileEmpty		: '�n�����Q���ܿհ� !',
		FileExists		: 'File %s already exists.', // MISSING
		FolderEmpty		: 'Ŀ����Q���ܿհ� !',
		FolderExists	: 'Folder %s already exists.', // MISSING
		FolderNameExists	: 'Folder already exists.', // MISSING

		FileInvChar		: '�n�����Q���ܰ���������Ԫ�� \n\\ / : * ? " < > |',
		FolderInvChar	: 'Ŀ����Q���ܰ���������Ԫ�� \n\\ / : * ? " < > |',

		PopupBlockView	: '�o������ҕ���_���n�� ! Ո�z��g�[�����O���K��ᘌ��@���Wվ �P�] <���i����ҕ��> �@������ !',
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
