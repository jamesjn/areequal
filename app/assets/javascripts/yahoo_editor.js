  
  
$(document).ready(function(){
var yahoo_simple_editor = new YAHOO.widget.SimpleEditor('art-description-yui', {
    height: '200px',
    width: '500px',
    handleSubmit: true,
    toolbar:{
draggable: false,
buttons: [
    { group: 'fontstyle', 
        buttons: [
            { type: 'select', 
                menu: [
                    { text: 'Arial', checked: true },
                    { text: 'Arial Black' },
                    { text: 'Comic Sans MS' },
                    { text: 'Courier New' },
                    { text: 'Lucida Console' },
                    { text: 'Tahoma' },
                    { text: 'Times New Roman' },
                    { text: 'Trebuchet MS' },
                    { text: 'Verdana' }
                ]
            },
            { type: 'spin', label: '13', value: 'fontsize', range: [ 9, 75 ]}
        ]
    },
    { type: 'separator' },
    { group: 'textstyle',
        buttons: [
            { type: 'push', label: 'Bold CTRL + SHIFT + B', value: 'bold' },
            { type: 'push', label: 'Italic CTRL + SHIFT + I', value: 'italic' },
            { type: 'push', label: 'Underline CTRL + SHIFT + U', value: 'underline' },
            { type: 'separator' },
            { type: 'color', label: 'Font Color', value: 'forecolor', disabled: true },
            { type: 'color', label: 'Background Color', value: 'backcolor', disabled: true }
        ]
    }
]
}
});
  yahoo_simple_editor.render();  
});

