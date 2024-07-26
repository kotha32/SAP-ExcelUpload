namespace com.sumanth.music;
using { managed, cuid } from '@sap/cds/common';


entity song : cuid, managed {
    key ID            : UUID;
    @title: 'SongID'
    song_id: String(30);
    @title: 'Song Name'
    song_name: String(50); // Increased length
    @title: 'Image URL'
    song_img: String default 'https://imgur.com/djS2boy.jpg';
    @title: 'Song URL'
    song_url: String default 'https://www.youtube.com/watch?v=6f6T4Zg0gic';
    // Assuming there should be a relation to artist
    art: Composition of many artist on art.artist_id=$self;
}

entity artist : cuid, managed {
    
    key ID            : UUID;
    @title: 'ArtistID'
    artist_id: Association to one song;
    @title: 'Artist Name'
    artist_name: String(50); // Increased length
    @title: 'E-mail'
    email: String(50); // Increased length
    @title: 'Address'
    address: String(50); // Increased length
}