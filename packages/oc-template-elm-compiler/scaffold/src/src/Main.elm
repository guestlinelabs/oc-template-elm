module Main exposing (..)

import Browser
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Json.Decode as D
import Json.Encode as E



-- MAIN


main : Program E.Value Model Msg
main =
    Browser.element
        { init = init
        , view = view >> toUnstyled
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { name : String, email : String }


init : E.Value -> ( Model, Cmd Msg )
init flags =
    ( case D.decodeValue decoder flags of
        Ok model ->
            model

        Err _ ->
            { name = "", email = "" }
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )



-- VIEW


inputStyle : Style
inputStyle =
    Css.batch
        [ border3 (px 5) solid (rgb 255 240 255)
        , boxShadow5 inset zero zero (px 8) (rgba 0 0 0 0.1)
        , padding (px 15)
        , backgroundColor (rgba 255 255 255 0.5)
        , margin (px 10)
        ]


view : Model -> Html Msg
view model =
    div
        [ css
            [ padding (px 20)
            ]
        ]
        [ input
            [ css [ inputStyle ]
            , type_ "text"
            , placeholder "Name"
            , value model.name
            ]
            []
        , input
            [ css [ inputStyle ]
            , type_ "text"
            , placeholder "Email"
            , value model.email
            ]
            []
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


decoder : D.Decoder Model
decoder =
    D.map2 Model
        (D.field "name" D.string)
        (D.field "email" D.string)
