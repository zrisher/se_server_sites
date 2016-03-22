# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

console.log('Hello World')

URXP_RUSTSERVER_URI = 'http://urxp-rustserver.cloudapp.net:28015'
URXP_RUSTSERVER_API_KEY = 'DnAYidXuoVKaUuJgJPBamndKLMnQjmng'

RESOURCE_TYPES = {
  Stones:	1
  SulfurOre:	2
  MetalOre:	4
  MetalFragments:	8
  HighQualityMetalOre:	16
  CrudeOil:	32
}

test_api_connection = ->

  if $('#map-container').length == 0
    return

  console.log('Build Resource Map - Requesting Data')

  test_path = '/resourcemap.json'
  test_uri = URXP_RUSTSERVER_URI + test_path + '?apiKey=' + URXP_RUSTSERVER_API_KEY
  console.log 'Requesting ' + test_uri

  xhr = $.getJSON test_uri

  xhr.done (data) ->
    console.log('successfully received data:')
    console.log('Build Resource Map - Received Data')
    build_resource_map(data)

  xhr.fail (error) ->
    console.log('Build Resource Map - Receipt Failed with error:')
    console.log(error)

build_resource_map = (data) ->
  console.log('Build Resource Map - Building HTML')

  table_rows = ''
  $.each data, (index, resource_map_row) ->
    row = '<tr>'

    $.each resource_map_row, (index, resource_map_cell) ->
      resources = []
      #has_hqm = has_oil = has_sulfur = has_frags = has_metal_ore = false
      #color = ''

      if (resource_map_cell & RESOURCE_TYPES.HighQualityMetalOre)
        resources.push('HQM')
        #has_hqm = true

      if (resource_map_cell & RESOURCE_TYPES.CrudeOil)
        resources.push('Oil')
        #has_oil = true

      if (resource_map_cell & RESOURCE_TYPES.SulfurOre)
        resources.push('Sulfur')
        #has_sulfur = true

      if (resource_map_cell & RESOURCE_TYPES.MetalFragments)
        resources.push('MetalFragments')
        #has_frags = true

      if (resource_map_cell & RESOURCE_TYPES.MetalOre)
        resources.push('MetalOre')
        #has_metal_ore = true

      if (resource_map_cell & RESOURCE_TYPES.Stones)
        resources.push('Stones')

      #if (has_hqm && has_sulfur && has_frags && has_metal_ore)
      #  color = '#FF0000';
      #else if (has_hqm && has_sulfur && has_frags)
      #  color = '#FF9900';
      #else if (has_hqm && has_sulfur && has_metal_ore)
      #  color = '#FF6600';
      #else if (has_hqm && has_sulfur)
      #  color = '#FFCC00';
      #else if (has_sulfur)
      #  color = 'yellow'
      #else if (has_oil)
      #  color = 'red'

      classes = $.map(resources, (r) -> r.toLowerCase()).concat('resource-map-cell').join(' ')
      tooltip = resource_map_cell + ': ' + resources.join(', ')

      row += '<td class="' + classes +
          '" data-toggle="tooltip" title="' + tooltip + '"></td>'

    row += '</tr>'
    table_rows += row;
  console.log('Build Resource Map - Inserting HTML')

  $('#map-container #resource-map').append(table_rows);

  # Tooltips take a long time to load and having styling issues where it'll move table cells
  # the chrome alt popup seems to work fine
  #console.log('Build Resource Map - Toggling Tooltips')
  #$('[data-toggle="tooltip"]').tooltip()

  console.log('Build Resource Map - DONE')

auto_close_alerts = ->
  $(".alert").fadeTo(2000, 1000).slideUp 1000, ->
    $(".alert").alert('close')

$(document).on 'page:change', ->
  test_api_connection()
  auto_close_alerts()

