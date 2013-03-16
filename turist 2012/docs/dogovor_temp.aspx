<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dogovor_temp.aspx.cs" Inherits="turist.docs.dogovor_temp" %>
<style type="text/css" media="print">
        .no_print { display:none
        }
a:link
	{color:blue;
	text-decoration:underline;
	text-underline:single;
        }
    </style>
<form id="form1" runat="server">
    <script type="text/javascript">
        function printpr() {
            var PROMPT = 1; // 2 DONTPROMPTUSER   
            var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
            document.body.insertAdjacentHTML('beforeEnd', WebBrowser)
            WebBrowser1.ExecWB(7, PROMPT)
            WebBrowser1.outerHTML = ""
        }  </script>
<div>

<p style="text-align: right; text-align: right;"><br>
    <input id="Button1" type="button" value="Печать"  onclick="javascript: print();" class="no_print" /></p>
<p> </p>

<p style="text-align: center; text-align: center;"><b>ДОГОВОР </b><b><asp:label id="ndoc" runat="server" text="nomer_dogovora"></asp:label></b></p>

<p style="text-align: center; text-align: center;"><b><span style="color: blue;"> (Номер договора/ номер заявки/номер счета)</span></b></p>

<p style="text-align: center; text-align: center;"><b>ОБ ОКАЗАНИИ ТУРИСТИЧЕСКИХ УСЛУГ</b></p>

<p style="text-align: center; text-align: center;"><b> </b></p>

<p>г. Астрахань «<asp:label id="chdoc" runat="server" text="chislo"></asp:label>» <asp:label id="mdoc" runat="server" text="mesac"></asp:label> 2012 г.<span style="color: red;"></span></p>

<p> </p>

<p style="text-align: justify;">Туристическое агентство «Натали-Тур», именуемое в дальнейшем АГЕНТСТВО, в лице Березинской Натальи Ивановой действующей на основании Свидетельства о внесении записи в Единый государственный реестр ИП серия 30 № 001114380 от 16.11.2004 г.<span style="color: red;">,</span> с одной стороны, и <asp:label id="client" runat="server" text="FIOclient"></asp:label>,<b> </b> именуемый в дальнейшем КЛИЕНТ, с другой стороны, вместе именуемые Стороны<b>, </b>руководствуясь Гражданским кодексом РФ, Федеральным законом «Об основах туристской деятельности», Законом РФ «О защите прав потребителей»,<b> </b>заключили настоящий договор о нижеследующем. <b><span style="color: red;"></span></b></p>

<p style="text-align: justify;">            </p>

<p style="text-align: justify;"><b><span style="text-decoration: underline">1. ПРЕДМЕТ ДОГОВОРА</span></b></p>

<p style="text-align: justify;"> </p>

<p style="text-align: justify;">1.1. АГЕНТСТВО организует <asp:Label  id="turtip" runat="server" Text="turtip"></asp:Label>
&nbsp;на базе «<asp:Label  id="nametur" runat="server" Text="nametur"></asp:Label>» по заказу КЛИЕНТА в соответствии с Договором.</p>

<p style="text-align: justify;">1.2. На условиях и в сроки, установленные настоящим Договором, АГЕНТСТВО обязуется организовать оказание следующего комплекса туристских услуг туристам, а КЛИЕНТ обязуется оплатить эти услуги:</p>

<p style="text-align: justify;">Маршрут: <asp:Label  id="faktadr" runat="server" Text="fakt_adres"></asp:Label></p>

<p>начало тура: <asp:Label  id="din" runat="server" Text="din"></asp:Label></p>

<p style="text-align: justify;">окончание тура<b>: </b><asp:Label  id="dout" runat="server" Text="dout"></asp:Label></p>

<p> </p>

<p style="text-align: justify;"><b><span style="text-decoration: underline">2. СОСТАВ ТУРИСТИЧЕСКОГО ПРОДУКТА</span></b></p>

<p style="text-align: justify;"> </p>

<p style="text-align: justify;">2.1. Тур включает в себя организационные услуги:<b> </b></p>

<p style="text-align: justify;"><b><asp:bulletedlist id="listserv" runat="server"></asp:bulletedlist>
    </b>.<b> </b></p>

<p style="text-align: justify;">Число туристов<b>: <asp:Label  id="turists" runat="server" Text="kol-vo_turist"></asp:Label></b></p>

<p style="text-align: justify;"> </p>

<p style="text-align: justify;"><b><span style="text-decoration: underline">3. СТОИМОСТЬ УСЛУГ И ПОРЯДОК РАСЧЕТОВ</span></b></p>

<p style="text-align: justify;"> </p>

<p style="text-align: justify;">3.1. Стоимость услуг, поименованных в п. 1.2, на дату заключения настоящего Договора, составляет </p>

<p style="text-align: justify;"><b><asp:Label  id="cost" runat="server" Text="cost"></asp:Label> </b>рублей (Сумма стоимостей услуг из пункта 2.1 договора).</p>

<p style="text-align: justify;">4.2. КЛИЕНТ одновременно с подписанием сторонами настоящего Договора вносит в счет оплаты стоимости услуг в кассу или на расчетный счет АГЕНСТВА 50% от стоимости тура (<span style="text-decoration: underline"><asp:Label  id="costmin" runat="server" Text="min_cost"></asp:Label></span> рублей) </p>

<p style="text-align: justify;">4.3. КЛИЕНТ оплачивает 100% стоимости комплекса услуг с учетом ранее внесенных авансов на базе, до начала тура.</p>

<p style="text-align: justify;">4.4. Факт полной оплаты услуг на расчетный счет АГЕНСТВА подтверждается платежным поручением</p>

<p style="text-align: justify;"><b><span style="text-decoration: underline">5. ОБЯЗАННОСТИ И ОТВЕТСТВЕННОСТЬ СТОРОН</span></b></p>

<p style="text-align: justify;"> </p>

<p style="text-align: justify;">5.1. КЛИЕНТ обязан принять и оплатить туристический продукт до начала тура в соответствии с условиями настоящего Договора.</p>

<p style="text-align: justify;">5.2. АГЕНТСТВО несет ответственность за организацию оказания комплекса услуг, входящих в приобретаемый КЛИЕНТОМ туристический продукт, оплаченный КЛИЕНТОМ.</p>

<p style="text-align: justify;">5.4. АГЕНТСТВО обязуется предоставить КЛИЕНТУ достоверную и необходимую информацию о потребительских свойствах туристического продукта в соответствии с действующим законодательством.</p>

<p style="text-align: justify;">5.5. АГЕНТСТВО не несет ответственности:</p>

<p style="text-align: justify;"> - за изменение сроков тура в связи с переносом времени или даты совершения рейса транспортной компанией, за задержку в выдаче въездной (выездной) визы посольства и другие, не зависящие от АГЕНТСТВА причины;</p>

<p style="text-align: justify;"> - за утерю багажа и личных вещей Туристов;</p>

<p style="text-align: justify;"> - за нарушение Туристами действующего законодательства РФ или временного - страны пребывания;</p>

<p style="text-align: justify;"> - за опоздание Туристов на регистрацию в аэропорту (порту, вокзале, автостанции).</p>

<p style="text-align: justify;">5.6. КЛИЕНТ обязан проинформировать Туристов о существенных условиях совершения туристской поездки, особенностях законодательства, обычаев и нравов страны, в которую они направляются, правилах поведения и основных факторах риска. Покупатель несет полную материальную ответственность за возможное нанесение Туристами материального ущерба третьим лицам.</p>

<p style="text-align: justify;">5.7. КЛИЕНТ несет полную ответственность за достоверность указанных паспортных данных Туристов, информации, предоставленной о Туристах АГЕНТСТВУ в соответствии с настоящим Договором и отсутствие у Туристов медицинских противопоказаний, если они ранее не были оговорены сторонами.</p>

<p style="text-align: justify;">5.8. Перевозка Туристов по настоящему Договору осуществляется по правилам организации-перевозчика (авиа-, железнодорожной компании и т.д.). Билет Туриста является договором с перевозчиком, в соответствии с которым всю ответственность за перевозку Туриста и его багажа несет перевозчик.</p>

<p style="text-align: justify;"><b><span style="text-decoration: underline"> </span></b></p>

<p style="text-align: justify;"><b><span style="text-decoration: underline">6. УСЛОВИЯ ОТКАЗА КЛИЕНТА ОТ ПОЕЗДКИ</span></b></p>

<p style="text-align: justify;"> </p>

<p style="text-align: justify;">6.1. В случае отказа от заказанного и оплаченного КЛИЕНТОМ туристического продукта применяются следующие штрафные санкции:</p>

<p style="background: white;">-30% стоимости тура при отказе в срок до 15 дней до начала тура; </p>

<p style="background: white;">-50% стоимости тура при отказе в срок от 15 до 10 дней до начала тура;</p>

<p style="background: white;">-75% стоимости тура отказе в срок от 10 до 5 дней до начала тура; </p>

<p style="background: white;">-100% стоимости тура при отказе за 3 дня до начала тура и менее.</p>

<p style="background-color: white;">Указанные суммы удерживаются АГЕНТСТВОМ из стоимости туристического продукта и возврату, клиенту не подлежат.</p>

<p style="text-align: justify;">6.2. Отказ от поездки должен быть подтвержден письменным заявлением КЛИЕНТОМ. Датой отказа считается день, в который АГЕНТСТВО получило заявление об отказе в установленной форме.</p>

<p style="text-align: justify;">6.3.В случае прерывания тура по инициативе КЛИЕНТА без согласования с<br>АГЕНТСТВОМ (поздний заезд /ранний выезд) денежные перерасчеты по стоимости<br>туристического продукта не производятся.</p>

<p style="text-align: justify;"> </p>

<p style="text-align: justify;"><b><span style="text-decoration: underline">7. ПОРЯДОК РАЗРЕШЕНИЯ СПОРОВ</span></b></p>

<p style="text-align: justify;"> </p>

<p style="text-align: justify;">7.1. В случае ненадлежащего исполнения АГЕНТСТВОМ своих обязанностей, а также претензий со стороны Туристов к качеству оказанных им согласно договора услуг, КЛИЕНТ обязан незамедлительно информировать об этом АГЕНТА.</p>

<p style="text-align: justify;">7.2. КЛИЕНТ вправе подать жалобу в письменном виде в адрес АГЕНТСТВА, не позднее 20 (двадцати) календарных дней со дня окончания тура. В этом случае АГЕНТСТВО обязуется рассмотреть жалобу КЛИЕНТА в 10-дневный срок. При невозможности разрешения спорных вопросов путем переговоров стороны обращаются в суд в установленном законом порядке.</p>

<p style="text-align: justify;"><b><span style="text-decoration: underline"> </span></b></p>

<p style="text-align: justify;"><b><span style="text-decoration: underline">8. ПОРЯДОК ИЗМЕНЕНИЯ И РАСТОРЖЕНИЯ ДОГОВОРА</span></b></p>

<p style="text-align: justify;"> </p>

<p style="text-align: justify;">8.1. Настоящий Договор составлен в двух экземплярах, имеющих равную юридическую силу.</p>

<p style="text-align: justify;">8.2. Договор вступает в силу с момента подписания и действует до выполнения сторонами своих обязательств. Изменение и расторжение настоящего Договора допускается в соответствии с законодательством РФ, в т.ч. Федеральным законом «Об основах туристской деятельности в РФ».</p>

<p style="text-align: justify;">8.3. Обязательства сторон прекращаются полным исполнением либо невозможностью исполнения вследствие обстоятельств непреодолимой силы, то есть чрезвычайных и непредвиденных при данных условиях (Форс-мажор).</p>

<p style="text-align: justify;"> </p>
<div ></div>
<p></p><p></p>
<p></p>
<table class="MsoNormalTable" style="border-collapse: collapse; border-collapse: collapse;"><tbody><tr><td style="width: 324px; width: 243pt; height: 33pt;">
  <p><b><span style="text-decoration: underline; text-align:center">9. РЕКВИЗИТЫ И ПОДПИСИ СТОРОН</span></b></p>
  <p><b>ИП Туристическое агентство</b></p>
  <p><b>414057 г. Астрахань, пр. Воробьева д. 7,кв. 141 тел/факс: <span style="text-decoration: underline">(8512)34-19-05, 8(8512)75-66-34</span>                                                              
  </b></p>
  <p><b>ИНН300801252022</b></p>
  <p><b>ОГРН304301732100113 БИК041203729,</b></p>
  <p><b> р/с 40802810400000000869 </b></p>
  <p><b>в ОАО«Волго-Каспийский Акционерный банк» в г. Астрахани </b></p>
  <p><b>к/с 301018107000000729 </b></p>
  <p><b>Центральный офис: </b></p>
  <p><b>414000, г</b><b>. Астрахань, ул. Ахшарумова, дом 151, офис 12. «НАТАЛИ тур» </b></p>
  <p><b><span style="text-decoration: underline">8-917-</span></b><b><span style="text-decoration: underline">175-11-56</span></b><b><span style="text-decoration: underline">                                                  
  </span></b></p>
  <p><b>e-mail: </b><b><span style="text-decoration: underline"><a href="mailto:///natali.vcasp2009@yandex.ru">natali.vcasp2009@yandex.ru</a></span></b><b></b></p>
  <p><b><a href="http://www.nbtour.ru/">www.nbtour.ru</a></b></p>
  <p><b> </b></p>
  <p><b> </b></p>
  <p><b> ________________ / Березинская Н.И./ </b></p>
  <p><b> М.П. </b></p>
  <p><b> </b></p>
  <p><b> </b></p>
  </td>
  <td style="width: 350px; width: 262pt; height: 33pt;">
  <p><b>КЛИЕНТ: </b></p>
  <p><b>ФИО (полностью) : </b><asp:Label  id="fio" runat="server" Text="fio"></asp:Label></p>
  <p><b>дата рождения : </b><asp:Label  id="birth" runat="server" Text="birhtday"></asp:Label></p>
  <p><b>паспорт :</b> <asp:Label  id="npasp" runat="server" Text="napsp"></asp:Label> <asp:Label  id="spasp" runat="server" Text="spasp"></asp:Label></p>
  <p><b>выдан : </b><asp:Label  id="whopasp" runat="server" Text="whopasp"></asp:Label></p>
  <p><b>дата выдачи : </b><asp:Label  id="wherepasp" runat="server" Text="wherepasp"></asp:Label></p>
  <p><b> </b></p>
  <p><b>тел: </b><asp:Label  id="phone" runat="server" Text="phone"></asp:Label></p>
  <p><b>эл.почта: </b><asp:Label  id="email" runat="server" Text="email"></asp:Label></p>
  <p><b> </b></p>
  <p><b>С условиями бронирования и продажи тура ознакомлен и связанные с ними обязательства принял на себя. </b></p>
  <p><b> </b></p>
  <p><b> </b></p>
  <p><b> </b></p>
  <p><b> </b></p>
  <p><b> </b></p>
  <p><b> </b></p>
  <p><b>__________________/<asp:Label  id="fioc" runat="server" Text="fioc"></asp:Label>/</b></p>
  <p><b> М.П.</b></p>
  <p><b> </b></p>
  <p><b> </b></p>
  <p><b>   </b></p>
  </td>
 </tr></tbody></table><p> </p>

<p> </p>

<p>                     </p>

<p> </p>

</div>
</form>

