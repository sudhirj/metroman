p = (o) -> '' + o + '%'


MetroMan = (container) ->        
    @load = (config) ->
        console.log 'loading', config
        config = $.extend({
            grid: {}
        }, config)
        
        gridConfig = $.extend({
            rows: 4
            columns: 4
            margin: 1
        }, config.grid)

        aspectRatio = $(container).height() / $(container).width()
        verticalMargin = gridConfig.margin
        horizontalMargin = gridConfig.margin * aspectRatio

        lostVerticalMargin = (gridConfig.rows + 1) * verticalMargin
        lostHorizontalMargin = (gridConfig.columns + 1) * horizontalMargin

        cellWidth = (100 - lostHorizontalMargin) / gridConfig.columns
        cellHeight = (100 - lostVerticalMargin) / gridConfig.rows
        $(container).empty()
        $.each config.elements, (index, item) ->
            width = p((item.width * cellWidth) + ((item.width - 1) * horizontalMargin))
            height = p((item.height * cellHeight) + ((item.height - 1) * verticalMargin))
            top = p((item.position.y * cellHeight) + ((item.position.y + 1) * verticalMargin))
            left = p((item.position.x * cellWidth) + ((item.position.x + 1) * horizontalMargin))

            cell = $('<div>').css({top: top, left: left, width: width, height: height, position: 'absolute'}).append($(item.view))
            $(container).append(cell)


    return this

window['MetroMan'] = MetroMan