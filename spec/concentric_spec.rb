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

  it 'sorts flex-direction before align-items' do
    css_attributes = <<-CSS
      display: flex;
      align-items: center;
      flex-direction: row;
      justify-content: space-between;
    CSS

    sorted_attributes = ConcentricSorter.sort(css_attributes.lines)

    expect(css_attributes.lines.length).to eq sorted_attributes.length
    expect(sorted_attributes.map(&:strip)).to eq [
      'display: flex;',
      'flex-direction: row;',
      'align-items: center;',
      'justify-content: space-between;'
    ]
  end

  context "when there's unknown attributes" do
    it 'sorts them alphabetically and puts them at the end' do
      css_attributes = <<-CSS
        pointer-events: none;
        z-index: 1000;
        background-image: url("");
        foobar: 1;
        padding-bottom: 20px;
      CSS

      sorted_attributes = ConcentricSorter.sort(css_attributes.lines)

      expect(css_attributes.lines.length).to eq sorted_attributes.length
      expect(sorted_attributes.map(&:strip)).to eq [
        'z-index: 1000;',
        'background-image: url("");',
        'padding-bottom: 20px;',
        'pointer-events: none;',
        'foobar: 1;'
      ]
    end
  end
end
