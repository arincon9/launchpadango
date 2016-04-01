# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class @OrdersIndexPage
  constructor: ->
    $("#orders-movie-filter").on "change", (event) => @handleMovieSelectChange(event)

  handleMovieSelectChange: (event)->
    movie_id =  event.target.value
    @filterOrders(movie_id)

  filterOrders: (movie_id) ->
    $.ajax "/admin/orders.js",
      type: "GET"
      data: { movie_id: movie_id }
      dataType: 'text'
      success: (data) ->
        $("#orders-list").html(data)

$ ->
  if window.location.href.replace(/https?:\/\/.*?\//g, '').match(/^admin\/orders$/)
    window.currentPage = new OrdersIndexPage
