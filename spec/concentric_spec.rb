require 'concentric_sorter'

RSpec.describe ConcentricSorter do
  it 'works' do
    css_attributes = <<-CSS
      background: none;
      margin-right: 13px;
      vertical-align: middle;
      padding: 0;
      font-size: 20px;
      line-height: normal;
    CSS

    sorted_attributes = ConcentricSorter.sort(css_attributes.lines)

    expect(css_attributes.lines.length).to eq sorted_attributes.length
    expect(sorted_attributes.map(&:strip)).to eq [
      'margin-right: 13px;',
      'background: none;',
      'padding: 0;',
      'vertical-align: middle;',
      'line-height: normal;',
      'font-size: 20px;'
    ]
  end

  it 'still works' do
    css_attributes = <<-CSS
      position: absolute;
      display: block;
      right: $dropdown-padding;
      top: $dropdown-arrow-top-distance - 2px;
      color: $base-font-color;
      content: "\\25BE";
      font-size: 2em;
    CSS

    sorted_attributes = ConcentricSorter.sort(css_attributes.lines)

    expect(css_attributes.lines.length).to eq sorted_attributes.length
    expect(sorted_attributes.map(&:strip)).to eq [
      'display: block;',
      'position: absolute;',
      'top: $dropdown-arrow-top-distance - 2px;',
      'right: $dropdown-padding;',
      'color: $base-font-color;',
      'font-size: 2em;',
      'content: "\\25BE";'
    ]
  end

  context 'when there are unknown attributes' do
    it 'orders them first' do
      css_attributes = <<-CSS
        display: block;
        box-sizing: content-box;
        foobar: lol;
        position: absolute;
      CSS

      sorted_attributes = ConcentricSorter.sort(css_attributes.lines)

      expect(css_attributes.lines.length).to eq sorted_attributes.length
      expect(sorted_attributes.map(&:strip)).to eq [
        'foobar: lol;',
        'box-sizing: content-box;',
        'display: block;',
        'position: absolute;'
      ]
    end
  end
end
