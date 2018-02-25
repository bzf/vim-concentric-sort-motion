require 'yaml'

# Class for taking unordered CSS attributes and sorting the by the
# concentric style
class ConcentricSorter
  def self.sort(lines)
    ConcentricSorter.new(lines).sort
  end

  def sort
    sort_lines_concentricly
  end

  private

  def sort_lines_concentricly
    @lines
      .map { |line| calculate_concentric_index(line) }
      .sort_by { |a| a.first || -1 }
      .map { |result| result[1] }
  end

  def calculate_concentric_index(line)
    line_property = line.split(':').first.strip
    index = CONCENTRIC_ORDER.find_index { |property| line_property == property }
    [index, line]
  end

  def initialize(lines)
    @lines = lines
  end
end

# Copied YML from `sass-lint`
# https://github.com/sasstools/sass-lint/blob/241e5a01eed1e15116f721792afb7fa1e6d28318/lib/config/property-sort-orders/concentric.yml
concentric_yml = <<-END_OF_YAML
# Concentric CSS
# http://rhodesmill.org/brandon/2011/concentric-css/

# Based on: https://github.com/brigade/scss-lint/blob/master/data/property-sort-orders/concentric.txt
# Updated list at: https://github.com/brandon-rhodes/Concentric-CSS/blob/master/style3.css

order:
  # box-sizing
  - 'box-sizing'
  
  # position
  - 'display'
  - 'position'
  - 'top'
  - 'right'
  - 'bottom'
  - 'left'

  - 'float'
  - 'clear'

  # align-content
  - 'align-content'
  - 'align-items'
  - 'align-self'

  # flex
  - 'flex'
  - 'flex-basis'
  - 'flex-direction'
  - 'flex-flow'
  - 'flex-grow'
  - 'flex-shrink'
  - 'flex-wrap'
  - 'justify-content'

  # grid
  - 'grid'
  - 'grid-area'
  - 'grid-template'
  - 'grid-template-areas'
  - 'grid-template-rows'
  - 'grid-template-columns'
  - 'grid-column'
  - 'grid-column-start'
  - 'grid-column-end'
  - 'grid-row'
  - 'grid-row-start'
  - 'grid-row-end'
  - 'grid-auto-rows'
  - 'grid-auto-columns'
  - 'grid-auto-flow'
  - 'grid-gap'
  - 'grid-row-gap'
  - 'grid-column-gap'

  # order
  - 'order'

  # columns
  - 'columns'
  - 'column-gap'
  - 'column-fill'
  - 'column-rule'
  - 'column-rule-width'
  - 'column-rule-style'
  - 'column-rule-color'
  - 'column-span'
  - 'column-count'
  - 'column-width'

  # transform
  - 'backface-visibility'
  - 'perspective'
  - 'perspective-origin'
  - 'transform'
  - 'transform-origin'
  - 'transform-style'

  # transition
  - 'transition'
  - 'transition-delay'
  - 'transition-duration'
  - 'transition-property'
  - 'transition-timing-function'

  # visibility
  - 'visibility'
  - 'opacity'
  - 'z-index'

  # margin
  - 'margin'
  - 'margin-top'
  - 'margin-right'
  - 'margin-bottom'
  - 'margin-left'

  # outline
  - 'outline'
  - 'outline-offset'
  - 'outline-width'
  - 'outline-style'
  - 'outline-color'
 
  # border
  - 'border'
  - 'border-top'
  - 'border-right'
  - 'border-bottom'
  - 'border-left'
  - 'border-width'
  - 'border-top-width'
  - 'border-right-width'
  - 'border-bottom-width'
  - 'border-left-width'

  # border-style
  - 'border-style'
  - 'border-top-style'
  - 'border-right-style'
  - 'border-bottom-style'
  - 'border-left-style'

  # border-radius
  - 'border-radius'
  - 'border-top-left-radius'
  - 'border-top-right-radius'
  - 'border-bottom-left-radius'
  - 'border-bottom-right-radius'

  # border-color
  - 'border-color'
  - 'border-top-color'
  - 'border-right-color'
  - 'border-bottom-color'
  - 'border-left-color'

  # border-image
  - 'border-image'
  - 'border-image-source'
  - 'border-image-width'
  - 'border-image-outset'
  - 'border-image-repeat'
  - 'border-image-slice'

  # box-shadow
  - 'box-shadow'

  # background
  - 'background'
  - 'background-attachment'
  - 'background-clip'
  - 'background-color'
  - 'background-image'
  - 'background-repeat'
  - 'background-position'
  - 'background-size'
  
  # cursor
  - 'cursor'

  # padding
  - 'padding'
  - 'padding-top'
  - 'padding-right'
  - 'padding-bottom'
  - 'padding-left'

  # width
  - 'width'
  - 'min-width'
  - 'max-width'

  # height
  - 'height'
  - 'min-height'
  - 'max-height'

  # overflow
  - 'overflow'
  - 'overflow-x'
  - 'overflow-y'
  - 'resize'

  # list-style
  - 'list-style'
  - 'list-style-type'
  - 'list-style-position'
  - 'list-style-image'
  - 'caption-side'

  # tables
  - 'table-layout'
  - 'border-collapse'
  - 'border-spacing'
  - 'empty-cells'

  # animation
  - 'animation'
  - 'animation-name'
  - 'animation-duration'
  - 'animation-timing-function'
  - 'animation-delay'
  - 'animation-iteration-count'
  - 'animation-direction'
  - 'animation-fill-mode'
  - 'animation-play-state'

  # vertical-alignment
  - 'vertical-align'

  # text-alignment and decoration
  - 'direction'
  - 'tab-size'
  - 'text-align'
  - 'text-align-last'
  - 'text-justify'
  - 'text-indent'
  - 'text-transform'
  - 'text-decoration'
  - 'text-decoration-color'
  - 'text-decoration-line'
  - 'text-decoration-style'
  - 'text-rendering'
  - 'text-shadow'
  - 'text-overflow'

  # text-spacing
  - 'line-height'
  - 'word-spacing'
  - 'letter-spacing'
  - 'white-space'
  - 'word-break'
  - 'word-wrap'
  - 'color'

  # font
  - 'font'
  - 'font-family'
  - 'font-size'
  - 'font-size-adjust'
  - 'font-stretch'
  - 'font-weight'
  - 'font-smoothing'
  - 'osx-font-smoothing'
  - 'font-variant'
  - 'font-style'

  # content
  - 'content'
  - 'quotes'

  # counters
  - 'counter-reset'
  - 'counter-increment'

  # breaks
  - 'page-break-before'
  - 'page-break-after'
  - 'page-break-inside'
END_OF_YAML

CONCENTRIC_ORDER ||= YAML.safe_load(concentric_yml)['order'].freeze
