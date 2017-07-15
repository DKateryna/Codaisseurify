function addSong(event) {
  var name = $("#song_name").val();
  var audioUrl = $("#song_audio_url").val();
  var artist = $("#song_artist_id").val();
  var newSong = {
    name: name,
    audio_url: audioUrl,
    artist_id: artist
  }

  $.ajax({
    type: "POST",
    url: "/api/artists/" + artist + "/songs",
    data: JSON.stringify(newSong),
    contentType: "application/json",
    dataType: "json",
    success: function(){
      window.location.reload(true);
    }
  });

}



$(document).ready(function() {
  $("#add_song").bind('click', addSong);

});
