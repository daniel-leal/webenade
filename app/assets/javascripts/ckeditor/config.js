CKEDITOR.editorConfig = function( config )
{
    config.toolbar_MyToolbar =
    [
        { name: 'clipboard', items : [ 'Cut','Copy','Paste','-','Undo','Redo' ] },
        { name: 'editing', items : [ 'Find','Replace','-','SelectAll', 'FontSize' ] },
        { name: 'insert', items : [ 'Image','Table','HorizontalRule','PageBreak' ] },
                '/',
        { name: 'styles', items : [ 'Styles','Format' ] },
        { name: 'basicstyles', items : [ 'Bold','Italic','Strike','-','RemoveFormat' ] },
        { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-' ] },
        { name: 'links', items : [ 'Link','Unlink' ] }
    ];
}