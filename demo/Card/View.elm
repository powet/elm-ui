module Card.View exposing (..)

import Card.Models exposing (..)
import Card.Messages exposing (..)
import Html exposing (Html)
import Html.Attributes as Attribute
import Html.Events as Events

import Mdl.Card.Models as MdlCard
import Mdl.Card.View as CardView


import Helpers.HtmlNode
import Css exposing (..)

import Html.CssHelpers

viewImage : Person -> Html image
viewImage model =
  Html.img
      [ Attribute.src "http://68.media.tumblr.com/tumblr_llfl0zHJoG1qho7cqo1_500.jpg"
      ]
      [ ]
        
view : Model->Html (Message header image footer)
view model =
  let    
    config = CardView.mdlCardConfig            
  in
    Html.body
          [ ]
          [ CardView.stylesheet
          , Html.div
              [ ]
              [ Html.map Card (CardView.view config
                                 Nothing--(Just (\m->Html.text "Header"))
                                 Nothing--(Just viewImage)                                 
                                 (Just viewContent)
                                 (Just (\m->Html.text "Footer"))
                                 model.card)
              ]
          ]

viewContent : Person->Html ContentMessage
viewContent person =
  Html.div
    [ Events.onClick (ContentClick "hello") ]
    [ Html.text (toString person) ]

  
    
