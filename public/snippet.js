<script>
  (function() {
  var jQuery;
  if (window.jQuery === undefined || window.jQuery.fn.jquery !== '1.4.2') {
      var script_tag = document.createElement('script');
      script_tag.setAttribute("type","text/javascript");
      script_tag.setAttribute("src", "//ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js");
      if (script_tag.readyState) {
        script_tag.onreadystatechange = function () { // For old versions of IE
            if (this.readyState == 'complete' || this.readyState == 'loaded') {
                scriptLoadHandler();
            }
        };
      } else {
        script_tag.onload = scriptLoadHandler;
      }
      (document.getElementsByTagName("head")[0] || document.documentElement).appendChild(script_tag);
  } else {
      jQuery = window.jQuery;
      main();
  }

  function scriptLoadHandler() {
      jQuery = window.jQuery.noConflict(true);
      main();
  }
  function main() {
      jQuery(document).ready(function($) {
          var css_link = $("<link>", {
              rel: "stylesheet",
              type: "text/css",
              href: "https://madc-newsletter.herokuapp.com/widgets.css"
          });
          css_link.appendTo('head');

          $("._madc_widget").append(
            $("<h3/>").text("Suscríbete al MADC Newsletter:"),
            $("<p/>").text("Ad ea incididunt sint dolor irure nostrud exercitation ex."),
            $("<form/>", {
            id: 'widget_subscribe',
            remote: 'true',
            action: 'https://madc-newsletter.herokuapp.com/subscribers.json',
            method: 'post'
            }).append(
            $("<input/>", {
            type: 'text',
            id: 'vname',
            name: 'subscriber[first_name]',
            placeholder: 'Nombre Completo'
            }),
            $("<input/>", {
            type: 'text',
            id: 'vemail',
            name: 'subscriber[email]',
            placeholder: 'Email'
            }),$("<input/>", {
            type: 'hidden',
            id: 'vemail',
            name: 'subscriber[subscribers_list_id]',
            value: 1,
            placeholder: 'Email'
            }), $("<br/>"), $("<input/>", {
            type: 'submit',
            id: 'submit',
            value: 'Enviar'
          })))

          $(function() {
              var form = $('#widget_subscribe');
              $(form).submit(function(event) {
                  event.preventDefault();
                  var formData = $(form).serialize();
                  $.ajax({
                      type: 'POST',
                      url: $(form).attr('action'),
                      data: formData,
                      success:   function(data) {
                        $(form).html("<h3>Gracias por su suscripción " + data.email+ "</h3>")
                      },
                      error: function(data) {
                        $(form).append("<h4>Error - Por favor ingresar un email válido.</h4>")
                      }
                  })

              });
          });
      });
  }
  })();


</script>
<div class="_madc_widget" id="_madc_widget"></div>
