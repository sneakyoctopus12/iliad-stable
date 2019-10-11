"======================================================================
|
|   Iliad.ILHTMLBuilderElement class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
|
| This file is part of the Iliad framework.
|
| Permission is hereby granted, free of charge, to any person obtaining
| a copy of this software and associated documentation files (the 
| 'Software'), to deal in the Software without restriction, including 
| without limitation the rights to use, copy, modify, merge, publish, 
| distribute, sublicense, and/or sell copies of the Software, and to 
| permit persons to whom the Software is furnished to do so, subject to 
| the following conditions:
|
| The above copyright notice and this permission notice shall be 
| included in all copies or substantial portions of the Software.
|
| THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, 
| EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
| MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
| IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
| CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
| TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
| SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  
|
 ======================================================================"



ILElement subclass: ILHTMLBuilderElement [
    
    <comment: nil>
    <category: 'Iliad-Core-XHTMLElements'>

    contentType [
	<category: 'accessing'>
	^'text/html; charset=', self session charset
    ]

    title [
	<category: 'accessing attributes'>
	^self attributeAt: 'title'
    ]

    title: aString [
	<category: 'accessing attributes'>
	^self attributeAt: 'title' put: aString
    ]


    cssClass: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'class' put: aString
    ]

    cssClass [
	<category: 'accessing attributes'>
	^self attributeAt: 'class'
    ]

    class: aString [
	<category: 'accessing'>
	self cssClass: aString
    ]

    id [
	<category: 'accessing attributes'>
	^self attributeAt: 'id'
    ]

    id: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'id' put: aString
    ]

    lang: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'lang' put: aString
    ]

    xmlLang: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'xml:lang' put: aString
    ]

    style [
	<category: 'accessing attributes'>
	^self attributeAt: 'style'
    ]

    style: aString [
	<category: 'accessing attibutes'>
	^self attributeAt: 'style' put: aString  
    ]

    onBlur: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'blur' add: aString
    ]

    onChange: aString [
	<category: 'accessing  attributes-events'>
	self onEvent: 'change' add: aString
    ]

    onClick: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'click' add: aString
    ]

    onDoubleClick: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'dblclick' add: aString
    ]

    onFocus: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'focus' add: aString
    ]

    onKeyDown: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'keydown' add: aString
    ]

    onKeyPress: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'keypress' add: aString
    ]

    onKeyUp: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'keyup' add: aString
    ]

    onMouseOut: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'mouseout' add: aString
    ]

    onMouseOver: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'mouseover' add: aString
    ]

    onSelect: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'select' add: aString
    ]

    onBlurDo: aBlock [
	<category: 'accessing attributes-events'>
	self onEvent: 'blur' do: aBlock
    ]

    onChangeDo: aBlock [
	<category: 'accessing  attributes-events'>
	self onEvent: 'change' do: aBlock
    ]

    onClickDo: aBlock [
	<category: 'accessing attributes-events'>
	self onEvent: 'click' do: aBlock
    ]

    onDoubleClickDo: aBlock [
	<category: 'accessing attributes-events'>
	self onEvent: 'dblclick' do: aBlock
    ]

    onFocusDo: aBlock [
	<categoryDo: 'accessing attributes-events'>
	self onEvent: 'focus' do: aBlock
    ]

    onKeyDownDo: aBlock [
	<categoryDo: 'accessing attributes-events'>
	self onEvent: 'keydown' do: aBlock
    ]

    onKeyPressDo: aBlock [
	<categoryDo: 'accessing attributes-events'>
	self onEvent: 'keypress' do: aBlock
    ]

    onKeyUpDo: aBlock [
	<categoryDo: 'accessing attributes-events'>
	self onEvent: 'keyup' do: aBlock
    ]

    onMouseOutDo: aBlock [
	<categoryDo: 'accessing attributes-events'>
	self onEvent: 'mouseout' do: aBlock
    ]

    onMouseOverDo: aBlock [
	<categoryDo: 'accessing attributes-events'>
	self onEvent: 'mouseover' do: aBlock
    ]

    onSelectDo: aBlock [
	<categoryDo: 'accessing attributes-events'>
	self onEvent: 'select' do: aBlock
    ]

    onEvent: aString add: anotherString [
	<category: 'accessing attributes-events'>
	| oldString |
	oldString := (self attributeAt: 'on', aString) ifNil: [''].
	self attributeAt: 'on', aString put: (oldString, anotherString)
    ]

    onEvent: aString do: aBlock [
	<category: 'accessing attributes-events'>
	| actionUrl |
	actionUrl := (self context urlBuilder urlForAction: 
	    (self session registerActionFor: aBlock)) greaseString.
	self 
	    onEvent: aString 
	    add: 'iliad.evaluateAction("', actionUrl, '");'
    ]

    a [
	<category: 'adding-convience'>
	^self add: ILAnchorElement new
    ]

    area [
	<category: 'adding-convience'>
	^self add: ILAreaElement new
    ]

    bdo [
	<category: 'adding-convience'>
	^self add: ILDirectionElement new
    ]

    big [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'big';
	    yourself)
    ]

    big: aString [
	<category: 'adding-convience'>
	^self big
	    contents: aString;
	    yourself
    ]

    blockquote [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'blockquote';
	    yourself)
    ]

    blockquote: aString [
	<category: 'adding-convience'>
	^self blockquote
	    contents: aString;
	    yourself
    ]

    b [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'b';
	    yourself)
    ]

    b: aString [
	<category: 'adding-convience'>
	^self b
	    contents: aString;
	    yourself
    ]

    br [
	<category: 'adding-convience'>
	^self add: ILBreakElement new
    ]

    button [
	<category: 'adding-convience'>
	^self add: ILButtonElement new
    ]

    checkbox [
	<category: 'adding-convience'>
	^self add: ILCheckboxElement new
    ]

    cite [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'cite';
	    yourself)
    ]

    cite: aString [
	<category: 'adding-convience'>
	^self cite
	    contents: aString;
	    yourself
    ]

    code [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'code';
	    yourself)
    ]

    code: aString [
	<category: 'adding-convience'>
	^self code
	    contents: aString;
	    yourself
    ]

    dd [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'dd';
	    yourself)
    ]

    dfn [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'dfn';
	    yourself)
    ]

    dl [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'dl';
	    yourself)
    ]

    dt [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'dt';
	    yourself)
    ]

    div [
	<category: 'adding-convience'>
	^self add: ILDivElement new
    ]

    em [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'em';
	    yourself)
    ]

    em: aString [
	<category: 'adding-convience'>
	^self em
	    contents: aString;
	    yourself
    ]

    favicon [
	<category: 'adding-convience'>
	^self link
	    beFavicon;
	    yourself
    ]

    favicon: aString [
	<category: 'adding-convience'>
	^self favicon
	    href: aString;
	    yourself
    ]

    fieldset [
	<category: 'adding-convience'>
	^self add: ILFieldsetElement new
    ]

    file [
	<category: 'adding-convience'>
	^self input
	    beFile;
	    yourself
    ]

    form [
	<category: 'adding-convience'>
	^self add: ILFormElement new
    ]

    h1 [
	<category: 'adding-convience'>
	^self add: (ILHeadingElement new
	    level: 1;
	    yourself)
    ]

    h1: aString [
	<category: 'adding-convience'>
	^self h1
	    text: aString;
	    yourself
    ]

    h2 [
	<category: 'adding-convience'>
	^self add: (ILHeadingElement new
	    level: 2;
	    yourself)
    ]

    h2: aString [
	<category: 'adding-convience'>
	^self h2
	    text: aString;
	    yourself
    ]

    h3 [
	<category: 'adding-convience'>
	^self add: (ILHeadingElement new
	    level: 3;
	    yourself)
    ]

    h3: aString [
	<category: 'adding-convience'>
	^self h3
	    text: aString;
	    yourself
    ]

    h4 [
	<category: 'adding-convience'>
	^self add: (ILHeadingElement new
	    level: 4;
	    yourself)
    ]

    h4: aString [
	<category: 'adding-convience'>
	^self h4
	    text: aString;
	    yourself
    ]

    h5 [
	<category: 'adding-convience'>
	^self add: (ILHeadingElement new
	    level: 5;
	    yourself)
    ]

    h5: aString [
	<category: 'adding-convience'>
	^self h5
	    text: aString;
	    yourself
    ]

    h6 [
	<category: 'adding-convience'>
	^self add: (ILHeadingElement new
	    level: 6;
	    yourself)
    ]

    h6: aString [
	<category: 'adding-convience'>
	^self h6
	    text: aString;
	    yourself
    ]

    h [
	<category: 'adding-convience'>
	^self add: ILHeadingElement new
    ]

    hr [
	<category: 'adding-convience'>
	^self add: ILHorizontalRuleElement new
    ]

    html: aString [
	<category: 'adding-convience'>
	^self add: (ILRawHtmlElement new
	    contents: aString;
	    yourself)
    ]

    if [
	<category: 'accessing'>
	^self add: (ILConditionalCommentElement new)
    ]

    img [
	<category: 'adding-convience'>
	^self add: ILImageElement new
    ]

    img: aString [
	<category: 'adding-convience'>
	^self img
	    src: aString;
	    yourself
    ]

    input [
	<category: 'adding-convience'>
	^self add: ILInputElement new
    ]

    i [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'i';
	    yourself)
    ]

    i: aString [
	<category: 'adding-convience'>
	^self i
	    contents: aString;
	    yourself
    ]

    javascript [
	<category: 'adding-convience'>
	^self script
	    beJavascript;
	    yourself
    ]

    label [
	<category: 'adding-convience'>
	^self add: ILLabelElement new
    ]

    legend [
	<category: 'adding-convience'>
	^self add: ILLegendElement new
    ]

    legend: aString [
	<category: 'adding-convience'>
	^self legend
	    text: aString;
	    yourself
    ]

    link [
	<category: 'adding-conveenience'>
	^self add: ILLinkElement new
    ]

    li [
	<category: 'adding-convience'>
	^self add: ILListItemElement new
    ]

    map [
	<category: 'adding-convience'>
	^self add: ILMapElement new
    ]

    meta [
	<category: 'adding-convience'>
	^self add: ILMetaElement new
    ]

    nbsp [
	^self add: (ILRawHtmlElement new 
	    contents: '&nbsp;'; 
	    yourself)
    ]

    object [
	<category: 'adding-convience'>
	^self add: ILObjectElement new
    ]

    option [
	<category: 'adding-convience'>
	^self add: ILOptionElement new
    ]

    optgroup [
	<category: 'adding-convience'>
	^self add: ILOptionGroupElement new
    ]
    
    ol [
	<category: 'adding-convience'>
	^self add: (ILListElement new 
	    beOrdered;
	    yourself)
    ]

    p [
	<category: 'adding-convience'>
	^self add: ILParagraphElement new
    ]

    param [
	<category: 'adding-convience'>
	^self add: ILParameterElement new
    ]

    password [
	<category: 'adding-convience'>
	^self input
	    bePassword;
	    yourself
    ]

    pre [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'pre';
	    yourself)
    ]

    pre: aString [
	<category: 'adding-convience'>
	^self pre
	    contents: aString;
	    yourself
    ]

    quote [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'quote';
	    yourself)
    ]

    quote: aString [
	<category: 'adding-convience'>
	^self quote
	    contents: aString;
	    yourself
    ]

    radio [
	<category: 'adding-convience'>
	^self add: ILRadioButtonElement new
    ]

    reset [
	<category: 'adding-convience'>
	^self input
	    beReset;
	    yourself
    ]

    script [
	<category: 'adding-convience'>
	^self add: ILScriptElement new
    ]

    script: aString [
	<category: 'adding-convience'>
	^self script
	    contents: aString;
	    yourself
    ]

    select [
	<category: 'adding-convience'>
	^self add: ILSelectElement new
    ]

    small [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'small';
	    yourself)
    ]

    small: aString [
	<category: 'adding-convience'>
	^self small
	    contents: aString;
	    yourself
    ]

    space [
	<category: 'adding-convience'>
	^self text: ' '
    ]

    span [
	<category: 'adding-convience'>
	^self add: ILSpanElement new
    ]

    strong [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'strong';
	    yourself)
    ]

    strong: aString [
	<category: 'adding-convience'>
	^self strong
	    contents: aString;
	    yourself
    ]

    stylesheet [
	<category: 'adding-convience'>
	^self link
	    beStylesheet;
	    yourself
    ]

    submit [
	<category: 'adding-convience'>
	^self input
	    beSubmit;
	    yourself
    ]

    subscript [
	<category: 'adding-convience'>
	^self add: (ILTextElement new
	    tag: 'subscript';
	    yourself)
    ]

    subscript: aString [
	<category: 'adding-convience'>
	^self subscript
	    contents: aString;
	    yourself
    ]

    superscript [
	<category: 'adding-convience'>
	^self add: (ILTextElement new
	    tag: 'superscript';
	    yourself)
    ]

    superscript: aString [
	<category: 'adding-convience'>
	^self superscript
	    contents: aString;
	    yourself
    ]

    table [
	<category: 'adding-convience'>
	^self add: ILTableElement new
    ]

    tbody [
	<category: 'adding-convience'>
	^self add: ILTableBodyElement new
    ]

    td [
	<category: 'adding-convience'>
	^self add: ILTableDataElement new
    ]

    tfoot [
	<category: 'adding-convience'>
	^self add: ILTableFootElement new
    ]

    thead [
	<category: 'adding-convience'>
	^self add: ILTableHeadElement new
    ]

    th [
	<category: 'adding-convience'>
	^self add: ILTableHeaderElement new
    ]

    tr [
	<category: 'adding-convience'>
	^self add: ILTableRowElement new
    ]

    tt [
	<category: 'adding-convience'>
	^self add: (ILTextElement new 
	    tag: 'tt';
	    yourself)
    ]

    textarea [
	<category: 'adding-convience'>
	^self add: ILTextAreaElement new
    ]

    ul [
	<category: 'adding-convience'>
	^self
	    add: (ILListElement new beUnordered;
	    yourself)
    ]

    var [
	<category: 'adding-convience'>
	^self add: (ILTextElement new
	    tag: 'var';
	    yourself)
    ]

    var: aString [
	<category: 'adding-convience'>
	^self var
	    contents: aString;
	    yourself
    ]
]
