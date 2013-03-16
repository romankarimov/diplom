
    
        (function(jq) {
            jq.autoScroll = function(ops) {
            ops = ops || {};
            ops.styleClass = ops.styleClass || 'scroll-to-top-button';
            var t = jq('<div class="'+ops.styleClass+'"></div>'),
            d = jq(ops.target || document);
            jq(ops.container || 'body').append(t);

            t.css({
                opacity: 0,
                position: 'absolute',
                top: 0,
                right: 0
            }).click(function() {
                jq('html,body').animate({
                    scrollTop: 0
                }, ops.scrollDuration || 100);
            });

            d.scroll(function() {
                var sv = d.scrollTop();
                if (sv < 10) {
                    t.clearQueue().fadeOut(ops.hideDuration || 200);
                    return;
                }

                t.css('display', '').clearQueue().animate({
                    top: sv,
                    opacity: 0.8
                }, ops.showDuration || 500);
            });
        };
    })(jQuery);


    $(document).ready(function(){
        $.autoScroll({
            scrollDuration: 200, 
            showDuration: 60, 
            hideDuration: 300
        });
    });
    function JSfunc()
{
    /* Making transliteration! */
    this.strTranslit = function(el)
    {
        new_el = document.getElementById('ctl00_MainContent_fiol');
        A = new Array();
        A["Ё"]="Yo";A["Й"]="I";A["Ц"]="Ts";A["У"]="U";A["К"]="K";A["Е"]="E";A["Н"]="N";A["Г"]="G";A["Ш"]="Sh";A["Щ"]="Sch";A["З"]="Z";A["Х"]="H";A["Ъ"]="'";
        A["ё"]="yo";A["й"]="i";A["ц"]="ts";A["у"]="u";A["к"]="k";A["е"]="e";A["н"]="n";A["г"]="g";A["ш"]="sh";A["щ"]="sch";A["з"]="z";A["х"]="h";A["ъ"]="'";
        A["Ф"]="F";A["Ы"]="I";A["В"]="V";A["А"]="A";A["П"]="P";A["Р"]="R";A["О"]="O";A["Л"]="L";A["Д"]="D";A["Ж"]="Zh";A["Э"]="E";
        A["ф"]="f";A["ы"]="i";A["в"]="v";A["а"]="a";A["п"]="p";A["р"]="r";A["о"]="o";A["л"]="l";A["д"]="d";A["ж"]="zh";A["э"]="e";
        A["Я"]="Ya";A["Ч"]="Ch";A["С"]="S";A["М"]="M";A["И"]="I";A["Т"]="T";A["Ь"]="'";A["Б"]="B";A["Ю"]="Yu";
        A["я"]="ya";A["ч"]="ch";A["с"]="s";A["м"]="m";A["и"]="i";A["т"]="t";A["ь"]="'";A["б"]="b";A["ю"]="yu";
        new_el.value = el.value.replace(/([\u0410-\u0451])/g,
        function (str,p1,offset,s) {
                if (A[str] != 'undefined'){return A[str];}
            }
        );
    }
    /* Normalizes a string, eю => eyu */
    this.strNormalize = function(el)
    {
        if (!el) { return; }
        this.strTranslit(el);
    }
    this.timeclient = function(el)
    {
       if (!el) { return;  }
       var d = new Date();
       d.setTime(Date.parse("21 May 1958 10:12"));
       el.toLocaleString(d);
    }
}
var oJS = new JSfunc();


