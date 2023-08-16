$(document).ready(function(){

      // fonctions d'affichage simple
      $(window).ready(function(){
          if ($(window).width() < 1200){
              $("nav>div a").hide();
          }
          else if ($(window).width() > 1200){
              $("nav>div a").show();
          }
      });
      $(window).on('resize', function(){
          if ($(window).width() < 1200){
              $("nav>div a").hide();
          }
          else if ($(window).width() > 1200){
              $("nav>div a").show();
          }
      });
      $("#menu").click(function(){
          $("nav>div a").slideToggle("slow");
      });

     // fonctions d'animation pour les boutons
     $("section>div img[src$='configuration.png']").click(function(){
          $("section>div:nth-of-type(2)").animate({
               width: "toggle"
          });
     });
     $("section>div img[src$='analytique.png']").click(function(){
          $("section>div:nth-of-type(3)").animate({
               width: "toggle"
          });
     });

     // fonction de retour au texte à partir de l'index
     $(".revenir").click(function(){
       window.history.back();
     });

     // orig & reg
     $(".reg").hide();
     $("#btn1").prop("checked", true);
     $("#btn1").click(function(){
          $(".orig").show();
          $(".reg").hide();
          $("label[for='btn2'] .bouton").css("transition", "1s");
          $("label[for='btn2'] .bouton").css("background-color", "rgb(250, 250, 250)");
          $("label[for='btn2']").css("transition", "1s");
          $("label[for='btn2']").css("color", "rgb(250, 250, 250)");
     });
     $("#btn2").click(function(){
          $(".orig").hide();
          $(".reg").show();
          $(".reg").css("color", "rgb(47, 129, 176)");
          $("label[for='btn2'] .bouton").css("transition", "1s");
          $("label[for='btn2'] .bouton").css("background-color", "rgb(47, 129, 176)");
          $("label[for='btn2']").css("transition", "1s");
          $("label[for='btn2']").css("color", "rgb(47, 129, 176)");
     });

     // sic & corr
     $(".corr").hide();
     $("#btn3").prop("checked", true);
     $("#btn3").click(function(){
          $(".sic").show();
          $(".corr").hide();
          $("label[for='btn4'] .bouton").css("transition", "1s");
          $("label[for='btn4'] .bouton").css("background-color", "rgb(250, 250, 250)");
          $("label[for='btn4']").css("transition", "1s");
          $("label[for='btn4']").css("color", "rgb(250, 250, 250)");
     });
     $("#btn4").click(function(){
          $(".sic").hide();
          $(".corr").show();
          $(".corr").css("color", "rgb(203, 47, 42)");
          $("label[for='btn4'] .bouton").css("transition", "1s");
          $("label[for='btn4'] .bouton").css("background-color", "rgb(203, 47, 42)");
          $("label[for='btn4']").css("transition", "1s");
          $("label[for='btn4']").css("color", "rgb(203, 47, 42)");
     });

     // abbr & expan
     $(".expan").hide();
     $("#btn5").prop("checked", true);
     $("#btn5").click(function(){
          $(".abbr").show();
          $(".expan").hide();
          $("label[for='btn6'] .bouton").css("transition", "1s");
          $("label[for='btn6'] .bouton").css("background-color", "rgb(250, 250, 250)");
          $("label[for='btn6']").css("transition", "1s");
          $("label[for='btn6']").css("color", "rgb(250, 250, 250)");
     });
     $("#btn6").click(function(){
          $(".abbr").hide();
          $(".expan").show();
          $(".expan").css("color", "rgb(50, 113, 24)");
          $("label[for='btn6'] .bouton").css("transition", "1s");
          $("label[for='btn6'] .bouton").css("background-color", "rgb(50, 113, 24)");
          $("label[for='btn6']").css("transition", "1s");
          $("label[for='btn6']").css("color", "rgb(50, 113, 24)");
     });

     // fonction de gestion des infobulles critiques
     $(".infobulle-critique").hide();
     $("#btn7").prop("checked", true);
     $("#btn7").click(function(){
          $(".infobulle-critique").hide();
          $(".infobulle-2").css("color", "rgb(250, 250, 250)");
          $("label[for='btn8'] .bouton").css("transition", "1s");
          $("label[for='btn8'] .bouton").css("background-color", "rgb(250, 250, 250)");
          $("label[for='btn8']").css("transition", "1s");
          $("label[for='btn8']").css("color", "rgb(250, 250, 250)");
     });
     $("#btn8").click(function(){
          $(".infobulle-critique").show();
          $(".infobulle-2").css("color", "rgb(163, 91, 167)");
          $("label[for='btn8'] .bouton").css("transition", "1s");
          $("label[for='btn8'] .bouton").css("background-color", "rgb(163, 91, 167)");
          $("label[for='btn8']").css("transition", "1s");
          $("label[for='btn8']").css("color", "rgb(163, 91, 167)");
     });

     // fonction de gestion des infobulles textuelles
     $(".infobulle-texte").hide();
     $("#btn9").prop("checked", true);
     $("#btn9").click(function(){
          $(".infobulle-texte").hide();
          $(".infobulle-1").css("color", "rgb(250, 250, 250)");
          $("label[for='btn10'] .bouton").css("transition", "1s");
          $("label[for='btn10'] .bouton").css("background-color", "rgb(250, 250, 250)");
          $("label[for='btn10']").css("transition", "1s");
          $("label[for='btn10']").css("color", "rgb(250, 250, 250)");
     });
     $("#btn10").click(function(){
          $(".infobulle-texte").show();
          $(".infobulle-1").css("color", "rgb(220, 123, 53)");
          $("label[for='btn10'] .bouton").css("transition", "1s");
          $("label[for='btn10'] .bouton").css("background-color", "rgb(220, 123, 53)");
          $("label[for='btn10']").css("transition", "1s");
          $("label[for='btn10']").css("color", "rgb(220, 123, 53)");
     });

});

function fonctionPhoto(code){
     var code = document.getElementById(code).lastElementChild;
     $(code).slideToggle("slow");
}
