/* Javascript functions */
function JSfunc()
{
    /* Making transliteration! */
    this.strTranslit = function(el)
    {
        new_el = document.getElementById('ctl00_MainContent_fiol');
        A = new Array();
        A["¨"]="YO";A["É"]="I";A["Ö"]="TS";A["Ó"]="U";A["Ê"]="K";A["Å"]="E";A["Í"]="N";A["Ã"]="G";A["Ø"]="SH";A["Ù"]="SCH";A["Ç"]="Z";A["Õ"]="H";A["Ú"]="'";
        A["¸"]="yo";A["é"]="i";A["ö"]="ts";A["ó"]="u";A["ê"]="k";A["å"]="e";A["í"]="n";A["ã"]="g";A["ø"]="sh";A["ù"]="sch";A["ç"]="z";A["õ"]="h";A["ú"]="'";
        A["Ô"]="F";A["Û"]="I";A["Â"]="V";A["À"]="A";A["Ï"]="P";A["Ð"]="R";A["Î"]="O";A["Ë"]="L";A["Ä"]="D";A["Æ"]="ZH";A["Ý"]="E";
        A["ô"]="f";A["û"]="i";A["â"]="v";A["à"]="a";A["ï"]="p";A["ð"]="r";A["î"]="o";A["ë"]="l";A["ä"]="d";A["æ"]="zh";A["ý"]="e";

        A["ß"]="YA";A["×"]="CH";A["Ñ"]="S";A["Ì"]="M";A["È"]="I";A["Ò"]="T";A["Ü"]="'";A["Á"]="B";A["Þ"]="YU";

        A["ÿ"]="ya";A["÷"]="ch";A["ñ"]="s";A["ì"]="m";A["è"]="i";A["ò"]="t";A["ü"]="'";A["á"]="b";A["þ"]="yu";

        new_el.value = el.value.replace(/([\u0410-\u0451])/g,

            function (str,p1,offset,s) {
                if (A[str] != 'undefined'){return A[str];}
            }
        );
    }
    /* Normalizes a string, eþ => eyu */
    this.strNormalize = function(el)
    {

        if (!el) { return; }

        this.strTranslit(el);
    }

}

var oJS = new JSfunc();


