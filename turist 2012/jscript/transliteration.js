/* Javascript functions */
function JSfunc()
{
    /* Making transliteration! */
    this.strTranslit = function(el)
    {
        new_el = document.getElementById('ctl00_MainContent_fiol');
        A = new Array();
        A["�"]="YO";A["�"]="I";A["�"]="TS";A["�"]="U";A["�"]="K";A["�"]="E";A["�"]="N";A["�"]="G";A["�"]="SH";A["�"]="SCH";A["�"]="Z";A["�"]="H";A["�"]="'";
        A["�"]="yo";A["�"]="i";A["�"]="ts";A["�"]="u";A["�"]="k";A["�"]="e";A["�"]="n";A["�"]="g";A["�"]="sh";A["�"]="sch";A["�"]="z";A["�"]="h";A["�"]="'";
        A["�"]="F";A["�"]="I";A["�"]="V";A["�"]="A";A["�"]="P";A["�"]="R";A["�"]="O";A["�"]="L";A["�"]="D";A["�"]="ZH";A["�"]="E";
        A["�"]="f";A["�"]="i";A["�"]="v";A["�"]="a";A["�"]="p";A["�"]="r";A["�"]="o";A["�"]="l";A["�"]="d";A["�"]="zh";A["�"]="e";

        A["�"]="YA";A["�"]="CH";A["�"]="S";A["�"]="M";A["�"]="I";A["�"]="T";A["�"]="'";A["�"]="B";A["�"]="YU";

        A["�"]="ya";A["�"]="ch";A["�"]="s";A["�"]="m";A["�"]="i";A["�"]="t";A["�"]="'";A["�"]="b";A["�"]="yu";

        new_el.value = el.value.replace(/([\u0410-\u0451])/g,

            function (str,p1,offset,s) {
                if (A[str] != 'undefined'){return A[str];}
            }
        );
    }
    /* Normalizes a string, e� => eyu */
    this.strNormalize = function(el)
    {

        if (!el) { return; }

        this.strTranslit(el);
    }

}

var oJS = new JSfunc();


