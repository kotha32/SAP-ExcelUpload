using { com.sumanth.music as db } from '../db/schema';

service music {
    entity song as projection on db.song;
}

annotate music.song with @odata.draft.enabled;

annotate music.song with {
    song_img @assert.match: '^https?:\/\/.*\.(?:png|jpg|jpeg)$';
};




annotate music.song with {
@Common.Text : ' {Product}'
@Core.IsURL: true
@Core.MediaType: 'image/jpg'
song_img;
};

annotate music.song with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Label: 'SongID',
            Value : song_id
        },
        {
            $Type : 'UI.DataField',
            Value : song_name
        },
        {
            $Type : 'UI.DataField',
            Value : song_img
        },
        {
            $Type : 'UI.DataField',
            Value : song_url
        }
    ],
);
annotate music.song with @(
    UI.FieldGroup #songInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
        {
            $Type : 'UI.DataField',
            Label: 'SongID',
            Value : song_id
        },
        {
            $Type : 'UI.DataField',
            Value : song_name
        },
        {
            $Type : 'UI.DataField',
            Value : song_img
        },
        {
            $Type : 'UI.DataField',
            Value : song_url
        }
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'songInfoFacet',
            Label : 'song Information',
            Target : '@UI.FieldGroup#songInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'artistInfoFacet',
            Label : 'artist Information',
            Target : 'art/@UI.LineItem',
        },
    ],
);

annotate music.artist with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Label:'ArtistID',
            Value : artist_id_ID
        },
        {
            $Type : 'UI.DataField',
            Value : artist_name
        },
        {
            $Type : 'UI.DataField',
            Value : email
        },
        {
            $Type : 'UI.DataField',
            Value : address
        }
    ],
);
annotate music.artist with @(
    UI.FieldGroup #songInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
        {
            $Type : 'UI.DataField',
            Label:'ArtistID',
            Value : artist_id_ID
        },
        {
            $Type : 'UI.DataField',
            Value : artist_name
        },
        {
            $Type : 'UI.DataField',
            Value : email
        },
        {
            $Type : 'UI.DataField',
            Value : address
        }
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'artistInfoFacet',
            Label : 'artist Information',
            Target : '@UI.FieldGroup#songInformation',
        },
    ],
);