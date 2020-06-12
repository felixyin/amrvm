/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

/**
 * @fileOverview Defines the {@link CKEDITOR.lang} object, for the
 * Chinese Traditional language.
 */

/**#@+
   @type String
   @example
*/

/**
 * Contains the dictionary of language entries.
 * @namespace
 */
CKEDITOR.lang['zh'] =
{
	/**
	 * The language reading direction. Possible values are "rtl" for
	 * Right-To-Left languages (like Arabic) and "ltr" for Left-To-Right
	 * languages (like English).
	 * @default 'ltr'
	 */
	dir : 'ltr',

	/*
	 * Screenreader titles. Please note that screenreaders are not always capable
	 * of reading non-English words. So be careful while translating it.
	 */
	editorTitle : 'Rich text editor, %1', // MISSING
	editorHelp : 'Press ALT 0 for help', // MISSING

	// ARIA descriptions.
	toolbars	: '��݋�����ߙ�',
	editor		: '���ı���݋��',

	// Toolbar buttons without dialogs.
	source			: 'ԭʼ�a',
	newPage			: '�_�n��',
	save			: '����',
	preview			: '�A�[',
	cut				: '����',
	copy			: '�}�u',
	paste			: '�N��',
	print			: '��ӡ',
	underline		: '�׾�',
	bold			: '���w',
	italic			: 'б�w',
	selectAll		: 'ȫ�x',
	removeFormat	: '�����ʽ',
	strike			: '�h����',
	subscript		: '��',
	superscript		: '�Ϙ�',
	horizontalrule	: '����ˮƽ��',
	pagebreak		: '�����퓷�̖',
	pagebreakAlt		: '��퓷�̖',
	unlink			: '�Ƴ����B�Y',
	undo			: '��ԭ',
	redo			: '���}',

	// Common messages and labels.
	common :
	{
		browseServer	: '�g�[�ŷ�����',
		url				: 'URL',
		protocol		: 'ͨӍ�f��',
		upload			: '�ς�',
		uploadSubmit	: '�ς����ŷ���',
		image			: 'Ӱ��',
		flash			: 'Flash',
		form			: '���',
		checkbox		: '��ȡ���K',
		radio			: '�x헰��o',
		textField		: '���ַ��K',
		textarea		: '���օ^��',
		hiddenField		: '�[�ؙ�λ',
		button			: '���o',
		select			: '���/�x��',
		imageButton		: 'Ӱ���o',
		notSet			: '<��δ�O��>',
		id				: 'ID',
		name			: '���Q',
		langDir			: '�Z�Է���',
		langDirLtr		: '������� (LTR)',
		langDirRtl		: '���Ҷ��� (RTL)',
		langCode		: '�Z�Դ��a',
		longDescr		: 'Ԕ�� URL',
		cssClass		: '��ʽ��e',
		advisoryTitle	: '���}',
		cssStyle		: '��ʽ',
		ok				: '�_��',
		cancel			: 'ȡ��',
		close			: '�ر�',
		preview			: 'Ԥ��',
		generalTab		: 'һ��',
		advancedTab		: '�M�A',
		validateNumberFailed : '��Ҫݔ�딵�ָ�ʽ',
		confirmNewPage	: '�F����޸���δ���棬Ҫ�_�n����',
		confirmCancel	: '�����x���δ���棬Ҫ�P�]��Ԓ�У�',
		options			: 'ѡ��',
		target			: 'Ŀ��',
		targetNew		: '�´���(_blank)',
		targetTop		: '��ҳ(_top)',
		targetSelf		: '������(_self)',
		targetParent	: '������(_parent)',
		langDirLTR		: 'Left to Right (LTR)', // MISSING
		langDirRTL		: 'Right to Left (RTL)', // MISSING
		styles			: 'Style', // MISSING
		cssClasses		: 'Stylesheet Classes', // MISSING
		width			: '����',
		height			: '�߶�',
		align			: '���R',
		alignLeft		: '�����R',
		alignRight		: '���Ҍ��R',
		alignCenter		: '����',
		alignTop		: '���ό��R',
		alignMiddle		: '���Ќ��R',
		alignBottom		: '�����R',
		invalidHeight	: '�߶ȱ�횞锵�ָ�ʽ',
		invalidWidth	: '���ȱ�횞锵�ָ�ʽ',
		invalidCssLength	: 'Value specified for the "%1" field must be a positive number with or without a valid CSS measurement unit (px, %, in, cm, mm, em, ex, pt, or pc).', // MISSING
		invalidHtmlLength	: 'Value specified for the "%1" field must be a positive number with or without a valid HTML measurement unit (px or %).', // MISSING
		invalidInlineStyle	: 'Value specified for the inline style must consist of one or more tuples with the format of "name : value", separated by semi-colons.', // MISSING
		cssLengthTooltip	: 'Enter a number for a value in pixels or a number with a valid CSS unit (px, %, in, cm, mm, em, ex, pt, or pc).', // MISSING

		// Put the voice-only part of the label in the span.
		unavailable		: '%1<span class="cke_accessibility">, ���P�]</span>'
	},

	contextmenu :
	{
		options : 'Context Menu Options' // MISSING
	},

	// Special char dialog.
	specialChar		:
	{
		toolbar		: '���������̖',
		title		: 'Ո�x�������̖',
		options : 'Special Character Options' // MISSING
	},

	// Link dialog.
	link :
	{
		toolbar		: '����/��݋���B�Y',
		other 		: '<����>',
		menu		: '��݋���B�Y',
		title		: '���B�Y',
		info		: '���B�Y�YӍ',
		target		: 'Ŀ��',
		upload		: '�ς�',
		advanced	: '�M�A',
		type		: '���B�����',
		toUrl		: 'URL', // MISSING
		toAnchor	: '����^�c',
		toEmail		: '����]��',
		targetFrame		: '<���>',
		targetPopup		: '<���@ҕ��>',
		targetFrameName	: 'Ŀ�˿�����Q',
		targetPopupName	: '���@ҕ�����Q',
		popupFeatures	: '���@ҕ������',
		popupResizable	: '�ɿs��',
		popupStatusBar	: '��B��',
		popupLocationBar: '�Wַ��',
		popupToolbar	: '������',
		popupMenuBar	: '�x����',
		popupFullScreen	: 'ȫΞĻ (IE)',
		popupScrollBars	: '���S',
		popupDependent	: '�Č� (NS)',
		popupLeft		: '��',
		popupTop		: '��',
		id				: 'ID',
		langDir			: '�Z�Է���',
		langDirLTR		: '������� (LTR)',
		langDirRTL		: '���Ҷ��� (RTL)',
		acccessKey		: '��ȡ�I',
		name			: '���Q',
		langCode			: '�Z�Է���',
		tabIndex			: '��λ���',
		advisoryTitle		: '���}',
		advisoryContentType	: '�������',
		cssClasses		: '��ʽ��e',
		charset			: '�B�Y�YԴ֮���a',
		styles			: '��ʽ',
		rel			: 'Relationship', // MISSING
		selectAnchor		: 'Ո�x���^�c',
		anchorName		: '���^�c���Q',
		anchorId			: '��Ԫ�� ID',
		emailAddress		: '����]��',
		emailSubject		: '�]����ּ',
		emailBody		: '�]������',
		noAnchors		: '(���ļ��Пo����֮�^�c)',
		noUrl			: 'Ոݔ�����B�Y�� URL',
		noEmail			: 'Ոݔ������]��λַ'
	},

	// Anchor dialog
	anchor :
	{
		toolbar		: '����/��݋�^�c',
		menu		: '�^�c����',
		title		: '�^�c����',
		name		: '�^�c���Q',
		errorName	: 'Ոݔ���^�c���Q',
		remove		: 'Remove Anchor' // MISSING
	},

	// List style dialog
	list:
	{
		numberedTitle		: 'Numbered List Properties', // MISSING
		bulletedTitle		: 'Bulleted List Properties', // MISSING
		type				: 'Type', // MISSING
		start				: 'Start', // MISSING
		validateStartNumber				:'List start number must be a whole number.', // MISSING
		circle				: 'Circle', // MISSING
		disc				: 'Disc', // MISSING
		square				: 'Square', // MISSING
		none				: 'None', // MISSING
		notset				: '<not set>', // MISSING
		armenian			: 'Armenian numbering', // MISSING
		georgian			: 'Georgian numbering (an, ban, gan, etc.)', // MISSING
		lowerRoman			: 'Lower Roman (i, ii, iii, iv, v, etc.)', // MISSING
		upperRoman			: 'Upper Roman (I, II, III, IV, V, etc.)', // MISSING
		lowerAlpha			: 'Lower Alpha (a, b, c, d, e, etc.)', // MISSING
		upperAlpha			: 'Upper Alpha (A, B, C, D, E, etc.)', // MISSING
		lowerGreek			: 'Lower Greek (alpha, beta, gamma, etc.)', // MISSING
		decimal				: 'Decimal (1, 2, 3, etc.)', // MISSING
		decimalLeadingZero	: 'Decimal leading zero (01, 02, 03, etc.)' // MISSING
	},

	// Find And Replace Dialog
	findAndReplace :
	{
		title				: '�����cȡ��',
		find				: '����',
		replace				: 'ȡ��',
		findWhat			: '����:',
		replaceWith			: 'ȡ��:',
		notFoundMsg			: 'δ�ҵ�ָ�������֡�',
		findOptions			: 'Find Options', // MISSING
		matchCase			: '��С������',
		matchWord			: 'ȫ�����',
		matchCyclic			: 'ѭ�h����',
		replaceAll			: 'ȫ��ȡ��',
		replaceSuccessMsg	: '����� %1 ��ȡ��'
	},

	// Table Dialog
	table :
	{
		toolbar		: '���',
		title		: '������',
		menu		: '������',
		deleteTable	: '�h�����',
		rows		: '�Д�',
		columns		: '�ڔ�',
		border		: '߅��',
		widthPx		: '����',
		widthPc		: '�ٷֱ�',
		widthUnit	: 'width unit', // MISSING
		cellSpace	: '�g��',
		cellPad		: '�Ⱦ�',
		caption		: '���}',
		summary		: 'ժҪ',
		headers		: '���}',
		headersNone		: '�o���}',
		headersColumn	: '��һ��',
		headersRow		: '��һ��',
		headersBoth		: '��һ�ں͵�һ��',
		invalidRows		: '�����һ��������',
		invalidCols		: '�����һ�����ę�',
		invalidBorder	: '߅���С��횞锵�ָ�ʽ',
		invalidWidth	: '��񌒶ȱ�횞锵�ָ�ʽ',
		invalidHeight	: '���߶ȱ�횞锵�ָ�ʽ',
		invalidCellSpacing	: '������g���횞锵�ָ�ʽ',
		invalidCellPadding	: '�����Ⱦ��횞锵�ָ�ʽ',

		cell :
		{
			menu			: '�����',
			insertBefore	: '������냦���',
			insertAfter		: '���Ҳ��냦���',
			deleteCell		: '�h�������',
			merge			: '�ρユ���',
			mergeRight		: '���Һρユ���',
			mergeDown		: '���ºρユ���',
			splitHorizontal	: '�M��ָ���',
			splitVertical	: '�v��ָ���',
			title			: '��������',
			cellType		: '�����e',
			rowSpan			: '������Д�',
			colSpan			: '�����ڔ�',
			wordWrap		: '�ԄӓQ��',
			hAlign			: 'ˮƽ���R',
			vAlign			: '��ֱ���R',
			alignBaseline	: '�������R',
			bgColor			: '�����ɫ',
			borderColor		: '߅���ɫ',
			data			: '����',
			header			: '���}',
			yes				: '��',
			no				: '��',
			invalidWidth	: '����񌒶ȱ�횞锵�ָ�ʽ',
			invalidHeight	: '�����߶ȱ�횞锵�ָ�ʽ',
			invalidRowSpan	: '������Д���횞�������ʽ',
			invalidColSpan	: '�����ڔ��ȱ�횞�������ʽ',
			chooseColor		: 'Choose' // MISSING
		},

		row :
		{
			menu			: '��',
			insertBefore	: '���ϲ�����',
			insertAfter		: '���²�����',
			deleteRow		: '�h����'
		},

		column :
		{
			menu			: '��',
			insertBefore	: '��������',
			insertAfter		: '���Ҳ����',
			deleteColumn	: '�h����'
		}
	},

	// Button Dialog.
	button :
	{
		title		: '���o����',
		text		: '�@ʾ���� (ֵ)',
		type		: '���',
		typeBtn		: '���o (Button)',
		typeSbm		: '�ͳ� (Submit)',
		typeRst		: '���O (Reset)'
	},

	// Checkbox and Radio Button Dialogs.
	checkboxAndRadio :
	{
		checkboxTitle : '��ȡ���K����',
		radioTitle	: '�x헰��o����',
		value		: '�xȡֵ',
		selected	: '���xȡ'
	},

	// Form Dialog.
	form :
	{
		title		: '��Ό���',
		menu		: '��Ό���',
		action		: '����',
		method		: '����',
		encoding	: '��ξ��a'
	},

	// Select Field Dialog.
	select :
	{
		title		: '���/�x�Ό���',
		selectInfo	: '�YӍ',
		opAvail		: '�����x�',
		value		: 'ֵ',
		size		: '��С',
		lines		: '��',
		chkMulti	: '�ɶ��x',
		opText		: '�@ʾ����',
		opValue		: '�xȡֵ',
		btnAdd		: '����',
		btnModify	: '�޸�',
		btnUp		: '����',
		btnDown		: '����',
		btnSetValue : '�O���A�Oֵ',
		btnDelete	: '�h��'
	},

	// Textarea Dialog.
	textarea :
	{
		title		: '���օ^�����',
		cols		: '��Ԫ����',
		rows		: '�Д�'
	},

	// Text Field Dialog.
	textfield :
	{
		title		: '���ַ��K����',
		name		: '���Q',
		value		: 'ֵ',
		charWidth	: '��Ԫ����',
		maxChars	: '�����Ԫ��',
		type		: '���',
		typeText	: '����',
		typePass	: '�ܴa'
	},

	// Hidden Field Dialog.
	hidden :
	{
		title	: '�[�ؙ�λ����',
		name	: '���Q',
		value	: 'ֵ'
	},

	// Image Dialog.
	image :
	{
		title		: 'Ӱ�����',
		titleButton	: 'Ӱ���o����',
		menu		: 'Ӱ�����',
		infoTab		: 'Ӱ���YӍ',
		btnUpload	: '�ς����ŷ���',
		upload		: '�ς�',
		alt			: '�������',
		lockRatio	: '�ȱ���',
		resetSize	: '���O��ԭ��С',
		border		: '߅��',
		hSpace		: 'ˮƽ���x',
		vSpace		: '��ֱ���x',
		alertUrl	: 'Ոݔ��Ӱ�� URL',
		linkTab		: '���B�Y',
		button2Img	: 'Ҫ��Ӱ���o�ĳ�Ӱ��᣿',
		img2Button	: 'Ҫ��Ӱ��ĳ�Ӱ���o�᣿',
		urlMissing	: 'Image source URL is missing.', // MISSING
		validateBorder	: 'Border must be a whole number.', // MISSING
		validateHSpace	: 'HSpace must be a whole number.', // MISSING
		validateVSpace	: 'VSpace must be a whole number.' // MISSING
	},

	// Flash Dialog
	flash :
	{
		properties		: 'Flash ����',
		propertiesTab	: '����',
		title			: 'Flash ����',
		chkPlay			: '�ԄӲ���',
		chkLoop			: '���}',
		chkMenu			: '�_���x��',
		chkFull			: '����ȫΞĻ�@ʾ',
 		scale			: '�s��',
		scaleAll		: 'ȫ���@ʾ',
		scaleNoBorder	: '�o߅��',
		scaleFit		: '���_����',
		access			: '���S�_���L��',
		accessAlways	: '���h',
		accessSameDomain: '��ͬ����',
		accessNever		: '����',
		alignAbsBottom	: '�^���·�',
		alignAbsMiddle	: '�^�����g',
		alignBaseline	: '���ʾ�',
		alignTextTop	: '�����Ϸ�',
		quality			: '�|��',
		qualityBest		: '���',
		qualityHigh		: '��',
		qualityAutoHigh	: '�ߣ��Ԅӣ�',
		qualityMedium	: '�У��Ԅӣ�',
		qualityAutoLow	: '�ͣ��Ԅӣ�',
		qualityLow		: '��',
		windowModeWindow: 'ҕ��',
		windowModeOpaque: '��͸��',
		windowModeTransparent : '͸��',
		windowMode		: 'ҕ��ģʽ',
		flashvars		: 'Flash ׃��',
		bgcolor			: '�����ɫ',
		hSpace			: 'ˮƽ���x',
		vSpace			: '��ֱ���x',
		validateSrc		: 'Ոݔ�����B�Y�� URL',
		validateHSpace	: 'ˮƽ�g���횞锵�ָ�ʽ',
		validateVSpace	: '��ֱ�g���횞锵�ָ�ʽ'
	},

	// Speller Pages Dialog
	spellCheck :
	{
		toolbar			: 'ƴ�֙z��',
		title			: 'ƴ�֙z��',
		notAvailable	: '��Ǹ������Ŀǰ��������',
		errorLoading	: '�o��ϵ�̷���: %s.',
		notInDic		: '�����ֵ���',
		changeTo		: '���Ğ�',
		btnIgnore		: '����',
		btnIgnoreAll	: 'ȫ������',
		btnReplace		: 'ȡ��',
		btnReplaceAll	: 'ȫ��ȡ��',
		btnUndo			: '��ԭ',
		noSuggestions	: '- �o���hֵ -',
		progress		: '�M��ƴ�֙z���С�',
		noMispell		: 'ƴ�֙z����ɣ�δ�l�Fƴ���e�`',
		noChanges		: 'ƴ�֙z����ɣ�δ�����κΆ���',
		oneChange		: 'ƴ�֙z����ɣ������� 1 ������',
		manyChanges		: 'ƴ�֙z����ɣ������� %1 ������',
		ieSpellDownload	: '��δ���bƴ�֙z��Ԫ�������Ƿ���Ҫ�F�����d��'
	},

	smiley :
	{
		toolbar	: '�����̖',
		title	: '��������̖',
		options : 'Smiley Options' // MISSING
	},

	elementsPath :
	{
		eleLabel : 'Elements path', // MISSING
		eleTitle : '%1 Ԫ��'
	},

	numberedlist	: '��̖���',
	bulletedlist	: '�Ŀ���',
	indent			: '���ӿs��',
	outdent			: '�p�ٿs��',

	justify :
	{
		left	: '�����R',
		center	: '����',
		right	: '���Ҍ��R',
		block	: '���Ҍ��R'
	},

	blockquote : '��������',

	clipboard :
	{
		title		: '�N��',
		cutError	: '�g�[���İ�ȫ���O�������S��݋���Ԅӈ��м�������Ոʹ�ÿ���I (Ctrl/Cmd+X) ���¡�',
		copyError	: '�g�[���İ�ȫ���O�������S��݋���Ԅӈ����}�u������Ոʹ�ÿ���I (Ctrl/Cmd+C) �}�u��',
		pasteMsg	: 'Ոʹ�ÿ���I (<strong>Ctrl/Cmd+V</strong>) �N���·��^���ЁK���� <strong>�_��</strong>',
		securityMsg	: '���g�[���İ�ȫ���O��������݋���o��ֱ�Ӵ�ȡ���ļ��N���Y�ϣ�Ո�������ڱ�ҕ���M���N�τ�����',
		pasteArea	: 'Paste Area' // MISSING
	},

	pastefromword :
	{
		confirmCleanup	: '�����N�ϵ������ƺ����� Word �}�u����Ո�����Ƿ�Ҫ����� Word �ĸ�ʽ�������N�ϣ�',
		toolbar			: '�� Word �N��',
		title			: '�� Word �N��',
		error			: 'It was not possible to clean up the pasted data due to an internal error' // MISSING
	},

	pasteText :
	{
		button	: '�N�鼃���ָ�ʽ',
		title	: '�N�鼃���ָ�ʽ'
	},

	templates :
	{
		button			: '�Ӱ�',
		title			: '���ݘӰ�',
		options : 'Template Options', // MISSING
		insertOption	: 'ȡ��ԭ�Ѓ���',
		selectPromptMsg	: 'Ո�x�����_���ĘӰ�<br> (ԭ�еă��݌��������):',
		emptyListMsg	: '(�o�Ӱ�)'
	},

	showBlocks : '�@ʾ�^�K',

	stylesCombo :
	{
		label		: '��ʽ',
		panelTitle	: 'Formatting Styles', // MISSING
		panelTitle1	: '�K��Ԫ�ؘ�ʽ',
		panelTitle2	: '��Ԫ�ؘ�ʽ',
		panelTitle3	: '���Ԫ�ؘ�ʽ'
	},

	format :
	{
		label		: '��ʽ',
		panelTitle	: '��ʽ',

		tag_p		: 'һ��',
		tag_pre		: '�Ѹ�ʽ��',
		tag_address	: 'λַ',
		tag_h1		: '���} 1',
		tag_h2		: '���} 2',
		tag_h3		: '���} 3',
		tag_h4		: '���} 4',
		tag_h5		: '���} 5',
		tag_h6		: '���} 6',
		tag_div		: 'һ�� (DIV)'
	},

	div :
	{
		title				: 'Create Div Container', // MISSING
		toolbar				: 'Create Div Container', // MISSING
		cssClassInputLabel	: 'Stylesheet Classes', // MISSING
		styleSelectLabel	: 'Style', // MISSING
		IdInputLabel		: 'Id', // MISSING
		languageCodeInputLabel	: ' Language Code', // MISSING
		inlineStyleInputLabel	: 'Inline Style', // MISSING
		advisoryTitleInputLabel	: 'Advisory Title', // MISSING
		langDirLabel		: 'Language Direction', // MISSING
		langDirLTRLabel		: 'Left to Right (LTR)', // MISSING
		langDirRTLLabel		: 'Right to Left (RTL)', // MISSING
		edit				: 'Edit Div', // MISSING
		remove				: 'Remove Div' // MISSING
  	},

	iframe :
	{
		title		: 'IFrame Properties', // MISSING
		toolbar		: 'IFrame', // MISSING
		noUrl		: 'Please type the iframe URL', // MISSING
		scrolling	: 'Enable scrollbars', // MISSING
		border		: 'Show frame border' // MISSING
	},

	font :
	{
		label		: '���w',
		voiceLabel	: '���w',
		panelTitle	: '���w'
	},

	fontSize :
	{
		label		: '��С',
		voiceLabel	: '���ִ�С',
		panelTitle	: '��С'
	},

	colorButton :
	{
		textColorTitle	: '�����ɫ',
		bgColorTitle	: '�����ɫ',
		panelTitle		: 'Colors', // MISSING
		auto			: '�Ԅ�',
		more			: '�����ɫ��'
	},

	colors :
	{
		'000' : 'Black', // MISSING
		'800000' : 'Maroon', // MISSING
		'8B4513' : 'Saddle Brown', // MISSING
		'2F4F4F' : 'Dark Slate Gray', // MISSING
		'008080' : 'Teal', // MISSING
		'000080' : 'Navy', // MISSING
		'4B0082' : 'Indigo', // MISSING
		'696969' : 'Dark Gray', // MISSING
		'B22222' : 'Fire Brick', // MISSING
		'A52A2A' : 'Brown', // MISSING
		'DAA520' : 'Golden Rod', // MISSING
		'006400' : 'Dark Green', // MISSING
		'40E0D0' : 'Turquoise', // MISSING
		'0000CD' : 'Medium Blue', // MISSING
		'800080' : 'Purple', // MISSING
		'808080' : 'Gray', // MISSING
		'F00' : 'Red', // MISSING
		'FF8C00' : 'Dark Orange', // MISSING
		'FFD700' : 'Gold', // MISSING
		'008000' : 'Green', // MISSING
		'0FF' : 'Cyan', // MISSING
		'00F' : 'Blue', // MISSING
		'EE82EE' : 'Violet', // MISSING
		'A9A9A9' : 'Dim Gray', // MISSING
		'FFA07A' : 'Light Salmon', // MISSING
		'FFA500' : 'Orange', // MISSING
		'FFFF00' : 'Yellow', // MISSING
		'00FF00' : 'Lime', // MISSING
		'AFEEEE' : 'Pale Turquoise', // MISSING
		'ADD8E6' : 'Light Blue', // MISSING
		'DDA0DD' : 'Plum', // MISSING
		'D3D3D3' : 'Light Grey', // MISSING
		'FFF0F5' : 'Lavender Blush', // MISSING
		'FAEBD7' : 'Antique White', // MISSING
		'FFFFE0' : 'Light Yellow', // MISSING
		'F0FFF0' : 'Honeydew', // MISSING
		'F0FFFF' : 'Azure', // MISSING
		'F0F8FF' : 'Alice Blue', // MISSING
		'E6E6FA' : 'Lavender', // MISSING
		'FFF' : 'White' // MISSING
	},

	scayt :
	{
		title			: '���rƴ���z��',
		opera_title		: 'Not supported by Opera', // MISSING
		enable			: '���ü��rƴ���z��',
		disable			: '�P�]���rƴ���z��',
		about			: '�P춼��rƴ���z��',
		toggle			: '���ã��P�]���rƴ���z��',
		options			: '�x�',
		langs			: '�Z��',
		moreSuggestions	: '����ƴ�����h',
		ignore			: '����',
		ignoreAll		: 'ȫ������',
		addWord			: '��ӆ��~',
		emptyDic		: '�ֵ����������.',

		optionsTab		: '�x�',
		allCaps			: 'Ignore All-Caps Words', // MISSING
		ignoreDomainNames : 'Ignore Domain Names', // MISSING
		mixedCase		: 'Ignore Words with Mixed Case', // MISSING
		mixedWithDigits	: 'Ignore Words with Numbers', // MISSING

		languagesTab	: '�Z��',

		dictionariesTab	: '�ֵ�',
		dic_field_name	: 'Dictionary name', // MISSING
		dic_create		: 'Create', // MISSING
		dic_restore		: 'Restore', // MISSING
		dic_delete		: 'Delete', // MISSING
		dic_rename		: 'Rename', // MISSING
		dic_info		: 'Initially the User Dictionary is stored in a Cookie. However, Cookies are limited in size. When the User Dictionary grows to a point where it cannot be stored in a Cookie, then the dictionary may be stored on our server. To store your personal dictionary on our server you should specify a name for your dictionary. If you already have a stored dictionary, please type its name and click the Restore button.', // MISSING

		aboutTab		: '�P�'
	},

	about :
	{
		title		: '�P� CKEditor',
		dlgTitle	: '�P� CKEditor',
		help	: 'Check $1 for help.', // MISSING
		userGuide : 'CKEditor User\'s Guide', // MISSING
		moreInfo	: '�L���҂��ľWվ�ԫ@ȡ�����P춅f�h����Ϣ',
		copy		: 'Copyright &copy; $1. All rights reserved.'
	},

	maximize : '���',
	minimize : '��С��',

	fakeobjects :
	{
		anchor		: '�^�c',
		flash		: 'Flash �Ӯ�',
		iframe		: 'IFrame', // MISSING
		hiddenfield	: 'Hidden Field', // MISSING
		unknown		: '�������'
	},

	resize : '��ק��׃��С',

	colordialog :
	{
		title		: 'Select color', // MISSING
		options	:	'Color Options', // MISSING
		highlight	: 'Highlight', // MISSING
		selected	: 'Selected Color', // MISSING
		clear		: 'Clear' // MISSING
	},

	toolbarCollapse	: '�۵�������',
	toolbarExpand	: 'չ��������',

	toolbarGroups :
	{
		document : 'Document', // MISSING
		clipboard : 'Clipboard/Undo', // MISSING
		editing : 'Editing', // MISSING
		forms : 'Forms', // MISSING
		basicstyles : 'Basic Styles', // MISSING
		paragraph : 'Paragraph', // MISSING
		links : 'Links', // MISSING
		insert : 'Insert', // MISSING
		styles : 'Styles', // MISSING
		colors : 'Colors', // MISSING
		tools : 'Tools' // MISSING
	},

	bidi :
	{
		ltr : 'Text direction from left to right', // MISSING
		rtl : 'Text direction from right to left' // MISSING
	},

	docprops :
	{
		label : '�ļ�����',
		title : '�ļ�����',
		design : 'Design', // MISSING
		meta : 'Meta �Y��',
		chooseColor : 'Choose', // MISSING
		other : '<����>',
		docTitle :	'�����}',
		charset : 	'��Ԫ���a',
		charsetOther : '������Ԫ���a',
		charsetASCII : 'ASCII', // MISSING
		charsetCE : '�КW�Zϵ',
		charsetCT : '���w���� (Big5)',
		charsetCR : '˹������',
		charsetGR : 'ϣ�D��',
		charsetJP : '����',
		charsetKR : '�n��',
		charsetTR : '��������',
		charsetUN : 'Unicode (UTF-8)', // MISSING
		charsetWE : '���W�Zϵ',
		docType : '�ļ����',
		docTypeOther : '�����ļ����',
		xhtmlDec : '���� XHTML ���x',
		bgColor : '�����ɫ',
		bgImage : '����Ӱ��',
		bgFixed : '��ˮӡ',
		txtColor : '�����ɫ',
		margin : '���߅��',
		marginTop : '��',
		marginLeft : '��',
		marginRight : '��',
		marginBottom : '��',
		metaKeywords : '�ļ������P�I�� (�ð��ζ�̖[,]�ָ�)',
		metaDescription : '�ļ��f��',
		metaAuthor : '����',
		metaCopyright : '�������',
		previewHtml : '<p>This is some <strong>sample text</strong>. You are using <a href="javascript:void(0)">CKEditor</a>.</p>' // MISSING
	}
};
