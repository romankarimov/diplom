<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listb_temp.aspx.cs" Inherits="turist.docs.listb_temp" %>
<script type="text/javascript">
    function printpr() {
        var PROMPT = 1; // 2 DONTPROMPTUSER   
        var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
        document.body.insertAdjacentHTML('beforeEnd', WebBrowser)
        WebBrowser1.ExecWB(7, PROMPT)
        WebBrowser1.outerHTML = ""
    }  </script>
<head>
    <style type="text/css" media="print">
        .no_print { display:none
        }
a:link
	{color:blue;
	text-decoration:underline;
	text-underline:single;
        }
    </style>
</head>

<form id="form1" runat="server">

<div>

<p style="text-align: right; text-align: right;">
    <input id="Button1" type="button" value="Печать"  onclick="javascript: print();" class="no_print" /></p>
    <p style="text-align: center; text-align: center;"><b>ЛИСТ БРОНИРОВАНИЯ</b></p>

<p style="text-align: center; text-align: center;">ЛИСТ БРОНИРОВАНИЯ №
    <asp:Label ID="ndoc" runat="server" Text="Label"></asp:Label>
    </p>

<p style="text-align: center; text-align: center;">(номер брони – номер заявки – номер договора/год)</p>

<table class="MsoNormalTable" style="border-collapse: collapse; border-collapse: collapse; border: none;"><tbody><tr><td style="width: 319px; width: 239pt; border: solid black 1pt;">
  <p>НАИМЕНОВАНИЕ ТУРНАПРАВЛЕНИЯ</p>
  </td>
  <td style="width: 319px; width: 239pt; border: solid black 1pt; border-left: none;">
  <p > <asp:Label  id="nametur" runat="server" Text="nametur"></asp:Label></p>
  </td>
 </tr><tr><td style="width: 319px; width: 239pt; border: solid black 1pt; border-top: none;">
  <p>КОЛИЧЕСТВО УЧАСТНИКОВ ТУРА</p>
  </td>
  <td style="width: 319px; width: 239pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p><b> <asp:Label  id="turists" runat="server" Text="kol-vo_turist"></asp:Label></b></p>
  </td>
 </tr><tr><td style="width: 319px; width: 239pt; border: solid black 1pt; border-top: none;">
  <p>УСЛОВИЯ РАЗМЕЩЕНИЯ</p>
  </td>
  <td style="width: 319px; width: 239pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p>&nbsp;</p>
  </td>
 </tr><tr><td style="width: 319px; width: 239pt; border: solid black 1pt; border-top: none;">
  <p>ДАТА ЗАЕЗДА</p>
  </td>
  <td style="width: 319px; width: 239pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p> <asp:Label  id="din" runat="server" Text="din"></asp:Label></p>
  </td>
 </tr><tr><td style="width: 319px; width: 239pt; border: solid black 1pt; border-top: none;">
  <p>ДАТА ОТЪЕЗДА</p>
  </td>
  <td style="width: 319px; width: 239pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p > <asp:Label  id="dout" runat="server" Text="dout"></asp:Label></p>
  </td>
 </tr><tr><td style="width: 319px; width: 239pt; border: solid black 1pt; border-top: none;">
  <p>КОЛИЧЕСТВО ДНЕЙ</p>
  </td>
  <td style="width: 319px; width: 239pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p ><asp:Label  id="dlin" runat="server" Text="dout"></asp:Label></p>
  </td>
 </tr><tr><td style="width: 319px; width: 239pt; border: solid black 1pt; border-top: none;">
  <p>ИТОГО СТОИМОСТЬ УСЛУГ</p>
  </td>
  <td style="width: 319px; width: 239pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p style="text-align: center; text-align: center;"> <b><asp:Label  id="cost" runat="server" Text="cost"></asp:Label> </b></p>
  </td>
 </tr></tbody></table><p style="text-align: center; text-align: center;">Список туристов</p>

<table class="MsoNormalTable" style="border-collapse: collapse; border-collapse: collapse; border: none;"><tbody><tr><td style="width: 35px; width: 26pt; border: solid black 1pt;">
  <p style="text-align: center; text-align: center;">№</p>
  </td>
  <td style="width: 171px; width: 128pt; border: solid black 1pt; border-left: none;">
  <p style="text-align: center; text-align: center;">Ф.И.О.</p>
  <p style="text-align: center; text-align: center;">Дата&nbsp; рождения</p>
  </td>
  <td style="width: 104px; width: 78pt; border: solid black 1pt; border-left: none;">
  <p style="text-align: center; text-align: center;">№, серия паспорта</p>
  </td>
  <td style="width: 115px; width: 86pt; border: solid black 1pt; border-left: none;">
  <p style="text-align: center; text-align: center;">Кем, когда выдан</p>
  </td>
  <td style="width: 105px; width: 79pt; border: solid black 1pt; border-left: none;">
  <p style="text-align: center; text-align: center;">Адрес места жительства</p>
  </td>
  <td style="width: 106px; width: 79pt; border: solid black 1pt; border-left: none;">
  <p style="text-align: center; text-align: center;">Телефон, электронный адрес</p>
  </td>
 </tr><tr><td style="width: 35px; width: 26pt; border: solid black 1pt; border-top: none;">
  <p style="text-align: center; text-align: center;">1</p>
  </td>
  <td style="width: 171px; width: 128pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p style="text-align: center; text-align: center;"> Томанов Алексей Николаевич, 01.12.1986 </p>
  </td>
  <td style="width: 104px; width: 78pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
      <p align="left" class="MsoNormal">
          <span lang="EN-US" style="mso-ansi-language:EN-US">1234 345666<o:p></o:p></span></p>
  </td>
  <td style="width: 115px; width: 86pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
      <p align="left" class="MsoNormal">
          <span lang="EN-US" style="mso-ansi-language:EN-US">01.03.1906<o:p></o:p></span></p>
      <span style="font-size:12.0pt;mso-bidi-font-size:10.0pt;line-height:150%;
font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-ansi-language:RU;mso-fareast-language:AR-SA;mso-bidi-language:AR-SA">РОВД Астрахани</span><p style="text-align: center; text-align: center;"> </p>
  </td>
  <td style="width: 105px; width: 79pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p style="text-align: center; text-align: center;"> <span style="font-size:12.0pt;mso-bidi-font-size:10.0pt;
line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;mso-fareast-font-family:
&quot;Times New Roman&quot;;mso-ansi-language:RU;mso-fareast-language:AR-SA;mso-bidi-language:
AR-SA">Астрахань, Савушкина 4/43</span></p>
  </td>
  <td style="width: 106px; width: 79pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p style="text-align: center; text-align: center;"> <span style="font-size:12.0pt;mso-bidi-font-size:10.0pt;
line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;mso-fareast-font-family:
&quot;Times New Roman&quot;;mso-ansi-language:RU;mso-fareast-language:AR-SA;mso-bidi-language:
AR-SA">36-56-45</span></p>
      <p style="text-align: center; text-align: center;"> <span lang="EN-US" style="font-size:12.0pt;mso-bidi-font-size:
10.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;mso-fareast-font-family:
&quot;Times New Roman&quot;;mso-ansi-language:EN-US;mso-fareast-language:AR-SA;
mso-bidi-language:AR-SA"><a href="mailto:tomanov@mail.ru">tomanov@mail.ru</a></span></p>
  </td>
 </tr><tr><td style="width: 35px; width: 26pt; border: solid black 1pt; border-top: none;">
  <p style="text-align: center; text-align: center;">2</p>
  </td>
  <td style="width: 171px; width: 128pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p style="text-align: center; text-align: center;"> Зарипова Оксана Михайловна</p>
  </td>
  <td style="width: 104px; width: 78pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
      <p align="left" class="MsoNormal">
          <span lang="EN-US" style="mso-ansi-language:EN-US">5421 334666<o:p></o:p></span></p>
  </td>
  <td style="width: 115px; width: 86pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p style="text-align: center; text-align: center;"> <span lang="EN-US" style="font-size:12.0pt;mso-bidi-font-size:
10.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;mso-fareast-font-family:
&quot;Times New Roman&quot;;mso-ansi-language:EN-US;mso-fareast-language:AR-SA;
mso-bidi-language:AR-SA">01.03.1906</span><span lang="EN-US" style="font-size:
12.0pt;mso-bidi-font-size:10.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;
mso-fareast-font-family:&quot;Times New Roman&quot;;mso-ansi-language:RU;mso-fareast-language:
AR-SA;mso-bidi-language:AR-SA"> </span><span style="font-size:12.0pt;
mso-bidi-font-size:10.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;
mso-fareast-font-family:&quot;Times New Roman&quot;;mso-ansi-language:RU;mso-fareast-language:
AR-SA;mso-bidi-language:AR-SA">РОВД Астрахани</span></p>
  </td>
  <td style="width: 105px; width: 79pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p style="text-align: center; text-align: center;"> <span style="font-size:12.0pt;mso-bidi-font-size:10.0pt;
line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;mso-fareast-font-family:
&quot;Times New Roman&quot;;mso-ansi-language:RU;mso-fareast-language:AR-SA;mso-bidi-language:
AR-SA">Астрахань, Татищева 4/43</span></p>
  </td>
  <td style="width: 106px; width: 79pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p style="text-align: center; text-align: center;"> <span style="font-size:12.0pt;mso-bidi-font-size:10.0pt;
line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;mso-fareast-font-family:
&quot;Times New Roman&quot;;mso-ansi-language:RU;mso-fareast-language:AR-SA;mso-bidi-language:
AR-SA">+7-9272362525</span></p>
      <p style="text-align: center; text-align: center;"> <span lang="EN-US" style="font-size:12.0pt;mso-bidi-font-size:
10.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;mso-fareast-font-family:
&quot;Times New Roman&quot;;mso-ansi-language:EN-US;mso-fareast-language:AR-SA;
mso-bidi-language:AR-SA"><a href="mailto:zariri@mail.ru">zariri@mail.ru</a></span></p>
  </td>
 </tr></tbody></table><p style="text-align: center; text-align: center;">Заполните</p>

<p>СОТРУДНИК АГЕНТСТВА</p>

<table class="MsoNormalTable" style="border-collapse: collapse; width: 473pt; border-collapse: collapse; border: none;"><tbody><tr><td style="width: 272px; width: 203pt; border: solid black 1pt;">
  <p style="text-align: center; text-align: center;">Ф.И.О., телефон, электронный адрес</p>
  </td>
  <td style="width: 213px; width: 159pt; border: solid black 1pt; border-left: none;">
  <p style="text-align: center; text-align: center;">Дата</p>
  </td>
  <td style="width: 146px; width: 109pt; border: solid black 1pt; border-left: none;">
  <p style="text-align: center; text-align: center;">Подпись</p>
  </td>
 </tr><tr><td style="width: 272px; width: 203pt; border: solid black 1pt; border-top: none;">
  <p style="text-align: center; text-align: center;"> Березинская Н.И</p>
  </td>
  <td style="width: 213px; width: 159pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p style="text-align: center; text-align: center;"> <asp:label id="date1" runat="server" text="chislo"></asp:label></p>
  </td>
  <td style="width: 146px; width: 109pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p style="text-align: center; text-align: center;"> </p>
  </td>
 </tr></tbody></table><p>КЛИЕНТ</p>

<table class="MsoNormalTable" style="border-collapse: collapse; width: 473pt; border-collapse: collapse; border: none;"><tbody><tr><td style="width: 272px; width: 203pt; border: solid black 1pt;">
  <p style="text-align: center; text-align: center;">Ф.И.О., телефон, электронный адрес</p>
  </td>
  <td style="width: 213px; width: 159pt; border: solid black 1pt; border-left: none;">
  <p style="text-align: center; text-align: center;">Дата</p>
  </td>
  <td style="width: 146px; width: 109pt; border: solid black 1pt; border-left: none;">
  <p style="text-align: center; text-align: center;">Подпись</p>
  </td>
 </tr><tr><td style="width: 272px; width: 203pt; border: solid black 1pt; border-top: none;">
  <p style="text-align: center; text-align: center;">
      <asp:label id="clientfio" runat="server" text="Label"></asp:label>
  </p>
  </td>
  <td style="width: 213px; width: 159pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p style="text-align: center; text-align: center;"> <asp:label id="date2" runat="server" text="chislo"></asp:label></p>
  </td>
  <td style="width: 146px; width: 109pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p style="text-align: center; text-align: center;"> </p>
  </td>
 </tr></tbody></table><p>Туристическое направление (Контактное лицо)</p>

<table class="MsoNormalTable" style="border-collapse: collapse; width: 473pt; border-collapse: collapse; border: none;"><tbody><tr><td style="width: 272px; width: 203pt; border: solid black 1pt;">
  <p style="text-align: center; text-align: center;">Ф.И.О., телефон, электронный адрес</p>
  </td>
  <td style="width: 213px; width: 159pt; border: solid black 1pt; border-left: none;">
  <p style="text-align: center; text-align: center;">Дата</p>
  </td>
  <td style="width: 146px; width: 109pt; border: solid black 1pt; border-left: none;">
  <p style="text-align: center; text-align: center;">Подпись</p>
  </td>
 </tr><tr><td style="width: 272px; width: 203pt; border: solid black 1pt; border-top: none;">
  <p style="text-align: center; text-align: center;">
      <asp:label id="turfio" runat="server" text="Label"></asp:label>
  </p>
  </td>
  <td style="width: 213px; width: 159pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p style="text-align: center; text-align: center;"> <asp:label id="date3" runat="server" text="chislo"></asp:label></p>
  </td>
  <td style="width: 146px; width: 109pt; border-top: none; border-left: none; border-bottom: solid black 1pt; border-right: solid black 1pt;">
  <p style="text-align: center; text-align: center;"> </p>
  </td>
 </tr></tbody></table></div>
</form>

