@compat function scatterplot(;x::AbstractVector = Int[],
                      y::AbstractVector = Int[],
                      group::AbstractVector = Int[])
    v = VegaVisualization()

    default_scales!(v)
    default_axes!(v)
    default_legend!(v)

    add_data!(v, x = x, y = y, group = group)
    add_points!(v)

    v.marks[1].properties.enter.fill = VegaValueRef(scale = "group", field = "group")
    v.marks[1].properties.enter.fillOpacity = VegaValueRef(value = 0.5)

    #Default to Paired color scale, 12
    colorscheme!(v, ("Paired", 12))
    return v
end
