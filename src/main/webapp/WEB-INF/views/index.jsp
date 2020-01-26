
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index</title>
    <script src="https://code.jquery.com/jquery-1.10.1.min.js"></script>
</head>
<body>
<h1>Welcome</h1>
<div id="blue">It is blue</div>
<script>
    $(document).ready(function () {
        $("#blue").css("background-color","blue")
    });
</script>
<sec:authorize access="isAnonymous()">
    <div>
        <a href="/login">Login</a>
    </div>
    <div>
        <a href="/register">Your registration</a>
    </div>
</sec:authorize>
<sec:authorize access="isAuthenticated()">

    <h1>Welcome to your Profile,${username}</h1>

    <div id="model-summary">
        <div class="model-name">Hundai Solaris</div>
        <div class="model-specs" id="modelSpecs"></div>
        <div class="model-price" id="modelPrice"></div>
        <div class="model-price" id="modelPriceUSD"></div>
        <div class="button">Заказать</div>
    </div>

    <form id="autoForm">
        <h2>Настрой авто для себя</h2>

        <div id="col-1-of-3">
            <h4>Двигатель</h4>
            <div id="form-block">
                <input type="radio" name="engine" id="engine1400" value="624900" checked/>
                <label for="engine1400">1.4 л. (100 л.с.)</label>
            </div>
            <div id="form-block">
                <input type="radio" name="engine" id="engine1600" value="749900"/>
                <label for="engine1600">1.6 л (123 л.с.)</label>
            </div>
        </div>
        <!--//col-1-of-3-->
        <div id="col-1-of-3">
            <h4>Коробка передач</h4>
            <div id="form-block">
                <input type="radio" name="transmission" id="transmission6MT" value="100000" checked/>
                <label for="transmission6MT">Ручная 6 ступеней (6МТ)</label>
            </div>
            <div id="form-block">
                <input type="radio" name="transmission" id="transmission6AT" value="125000"/>
                <label for="transmission6AT">Автомат 6 ступеней (6АТ)</label>
            </div>
        </div>
        <!--new div-->
        <div id="col-1-of-3">
            <h4>Пакет (дополнительние опции)</h4>
            <div id="form-block">
                <input type="radio" name="package" id="packageActive" value="85000" checked/>
                <label for="packageActive">Active</label>
            </div>
            <div id="form-block">
                <input type="radio" name="package" id="packageActivePlus" value="135000"/>
                <label for="packageActivePlus">Active Plus (кондиционер)</label>
            </div>
            <div id="form-block">
                <input type="radio" name="package" id="packageComfort" value="150000"/>
                <label for="packageComfort">Comfort (климатконтроль)</label>
            </div>
        </div>
    </form>

    <script>
        $(document).ready(function(){

            var modelSpecs,
                modelPrice,
                modelSpecksHolder,
                modelPriceHolder,
                priceUSD;

            modelSpecksHolder = $('#modelSpecs');
            modelPriceHolder = $('#modelPrice');
            priceUSD = $('#modelPriceUSD');

            modelPrice = 0;
            modelSpecs = '';

            //Старт сторінки
            calculatePrice();
            compileSpecs();

            $('#autoForm input').on('change',function(){
                calculatePrice();
                compileSpecs();
                calculateUSD();
            });

            function calculatePrice(){
                var modelPriceEngine = $('input[name=engine]:checked','#autoForm').val();
                var modelPriceTransmission = $('input[name=transmission]:checked','#autoForm').val();
                var modelPricePackage = $('input[name=package]:checked','#autoForm').val();
                modelPriceEngine = parseInt(modelPriceEngine);
                modelPriceTransmission = parseInt(modelPriceTransmission);
                modelPricePackage = parseInt(modelPricePackage);
                modelPrice = modelPriceEngine + modelPriceTransmission + modelPricePackage;

                modelPriceHolder.text(addSpace(modelPrice)+' гривень');
            };

            function compileSpecs(){
                modelSpecs = $('input[name=engine]:checked + label','#autoForm').text();
                modelSpecs = modelSpecs +", " + $('input[name=transmission]:checked + label','#autoForm').text();
                modelSpecs = modelSpecs +", " + $('input[name=package]:checked + label','#autoForm').text() + '.';
                modelSpecksHolder.text(modelSpecs);
            }


            var currencyUrl = ' https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5';
            var grnUSDRete = 0;


            $.ajax({
                url: currencyUrl,
                cache: false,
                success: function (html){
                    console.log(html[0].buy);
                    grnUSDRete = html[0].buy;
                    calculateUSD();
                }
            });

            function calculateUSD(){
                var modelPriceUSD = modelPrice / grnUSDRete;
                priceUSD.text('$ ' + addSpace(modelPriceUSD.toFixed(0) ) );
            }


            function addSpace(nStr){
                nStr+='';
                x=nStr.split('.');
                x1=x[0];
                x2=x.length>1?'.'+x[1]:'';
                var rgx=/(\d+)(\d{3})/;
                while(rgx.test(x1)){
                    x1=x1.replace(rgx,'$1'+' '+'$2');
                }
                return x1+x2;
            }
        });
    </script>

    <div>
        <a href="/logout">
            <button>Logout</button>
        </a>
    </div>

</sec:authorize>
</body>
</html>