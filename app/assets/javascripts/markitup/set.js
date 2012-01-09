mySettings = {
    nameSpace:          'markdown', // Useful to prevent multi-instances CSS conflict
    previewParserPath:  '/markitdown/preview',
    onShiftEnter:       {keepDefault:false, openWith:'\n\n'},
    markupSet: [
        {name:'Encabezado de primer nivel', key:"1", placeHolder:'Escribe un título...', closeWith:function(markItUp) { return miu.markdownTitle(markItUp, '=') } },
        {name:'Encabezado de segundo nivel', key:"2", placeHolder:'Escribe un título...', closeWith:function(markItUp) { return miu.markdownTitle(markItUp, '-') } },
        {name:'Encabezado de tercer nivel', key:"3", openWith:'### ', placeHolder:'Escribe un título...' },
        {separator:'---------------' },        
        {name:'Negrita', key:"B", openWith:'**', closeWith:'**'},
        {name:'Itálica', key:"I", openWith:'_', closeWith:'_'},
        {separator:'---------------' },
        {name:'Lista con viñetas', openWith:'- ' },
        {name:'Lista numerada', openWith:function(markItUp) {
            return markItUp.line+'. ';
        }},
        {separator:'---------------' },
        {name:'Imagen', key:"P", replaceWith:'![[![Alternative text]!]]([![Url:!:http://]!] "[![Title]!]")'},
        {name:'Enlace', key:"L", openWith:'[', closeWith:']([![Url:!:http://]!] "[![Title]!]")', placeHolder:'Your text to link here...' },
        {separator:'---------------'},    
        {name:'Comillas', openWith:'> '},
        {name:'Bloque de código', openWith:'(!(\t|!|`)!)', closeWith:'(!(`)!)'},
        {separator:'---------------'},
        {name:'Previsualizar', call:'preview', className:"preview"}
    ]
}

// mIu nameSpace to avoid conflict.
miu = {
    markdownTitle: function(markItUp, char) {
        heading = '';
        n = $.trim(markItUp.selection||markItUp.placeHolder).length;
        for(i = 0; i < n; i++) {
            heading += char;
        }
        return '\n'+heading+'\n';
    }
}