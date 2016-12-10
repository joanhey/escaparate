$(document)
  .on('click', '.btn-preview', function(evt){
    evt.preventDefault();
    var selector = "#web-" + $(this).data("id");
    var datos = JSON.parse($(selector).val());

    $("#web-header").html(datos.url);
    $("#site-image").attr("src", datos.imagen);
    $("#site-url").attr("href", datos.url);
    $("#site-url").html(datos.url);
    $("#web-category").html(datos.categoria);
    $("#author-name").html(datos.autor);
    $("#country-name").html(datos.pais);

    $("#web-list").fadeOut();
    $("#particular-web").fadeIn();

  })
  .on('click', '.btn-part-close', function(evt){
    evt.preventDefault();
    $("#particular-web").fadeOut();
    $("#web-list").fadeIn();
  })
  .on('click', '#site-url', function(evt){
    evt.preventDefault();
    var url = $(this).attr("href");
    if (url.indexOf("http://") === -1 || url.indexOf("https://") === -1) {
      url = "http://" + url;
    }
    var win = window.open(url, '_blank');
    win.focus();
  })
