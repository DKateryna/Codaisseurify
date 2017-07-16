function onLoadSongsSuccess(data) {

  $("#songs_list").empty();
  for(var i in data.songs){

      var id = data.songs[i];
      var songUrl = `/artists/${id.artist_id}/songs/${id.id}`;
      var href = $('<a>').attr('href', songUrl).html(id.name);
      var del = $('<a>[Delete song]</a>')
      .attr('onClick', `confirm("Are you sure?") ? deleteSong(${id.artist_id}, ${id.id}) : true;`)
      .attr('name', `delete-song-${id.id}`);
      var li = $('<li>').append(href).append(del);

    $("#songs_list").append(li);
  }
}

function loadSongsList(){
  var artist = $("#song_artist_id").val();
  if(!artist){
    return;
  }


  $.ajax({
    type: "GET",
    url: "/api/artists/" + artist + "/songs",
    contentType: "application/json",
    dataType: "json",
  }).done(onLoadSongsSuccess).fail(onAddSongError);
}


function onAddSongSuccess(){
   $("#song_name").val(null);
   $("#song_audio_url").val(null);
   loadSongsList();
}

function onAddSongError(error){

  alert(error.responseText);
}

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
    dataType: "json"
    }).done(onAddSongSuccess).fail(onAddSongError);

}

function deleteSong(artistId, songId){
  $.ajax({
    type: "DELETE",
    url: `/api/artists/${artistId}/songs/${songId}`,
    contentType: "application/json",
    dataType: "json"
  }).done(loadSongsList).fail(onAddSongError);
}

function deleteAllSongs(artistId){
  $.ajax({
    type: "DELETE",
    url: `/api/artists/${artistId}/songs`,
    contentType: "application/json",
    dataType: "json"
  }).done(loadSongsList).fail(onAddSongError);
}

document.addEventListener("turbolinks:load", function() {
  $("#add_song").bind('click', addSong);
  loadSongsList();

});
