# app/controllers/pages_controller.rb

def get_dataset
  render json: { lines: Line.all }
end

# app/views/pages/home.html.erb

<div class="container table-container">
 <div class="row">
   <div class="col-md-8 col-md-offset-2">
     <table id="server-side-table" class="display">
     </table>
   </div>
 </div>
</div>

# app/assets/javascripts/pages.js

$('#server-side-table').DataTable({
   ajax: {

       url: '/get_processed_dataset',

       dataSrc: 'lines',

   },
   serverSide: true,
   columns: ,
   order: ]

});

def get_processed_dataset
  lines = Line.datatable_filter(params, params)
  lines_filtered = lines.count
  render json: { lines: lines,
                 draw: params.to_i,
                 recordsTotal: Line.count,
                 recordsFiltered: lines_filtered }
end

# app/models/line.rb
DATATABLE_COLUMNS = %w.freeze
class << self
  def datatable_filter(search_value, search_columns)
    return all if search_value.blank?
    result = none
    search_columns.each do |key, value|
      filter = where("#{DATATABLE_COLUMNS} ILIKE ?", "%#{search_value}%")
      result = result.or(filter) if value
    end
    result
  end
end

# action get_processed_dataset
def get_processed_dataset
  lines = Line.datatable_filter(params, params)
  lines_filtered = lines.count
  lines = lines.datatable_order(params.to_i,
                                params)
  render json: { lines: lines,
                 draw: params.to_i,
                 recordsTotal: Line.count,
                 recordsFiltered: lines_filtered }
end

# app/models/line.rb

class Line < ApplicationRecord
  DATATABLE_COLUMNS = %w.freeze

  class << self
    def datatable_filter(search_value, search_columns)
      return all if search_value.blank?
      result = none
      search_columns.each do |key, value|
        filter = where("#{DATATABLE_COLUMNS} ILIKE ?", "%#{search_value}%")
        result = result.or(filter) if value
      end
      result
    end
    def datatable_order(order_column_index, order_dir)
      order("#{Line::DATATABLE_COLUMNS} #{order_dir}")
    end
  end
end

# update

def get_processed_dataset
  lines = Line.datatable_filter(params, params)
  lines_filtered = lines.count
  lines = lines.datatable_order(params.to_i,
                                params)
  lines = lines.page(params.to_i + 1).per(params)
  render json: { lines: lines,
                 draw: params.to_i,
                 recordsTotal: Line.count,
                 recordsFiltered: lines_filtered }
end

# app/views/pages/home.html.erb

<div class="container table-container">
  <div class="row">
    <div class="col-md-6">
      <table id="ajax-table" class="display">
      </table>
    </div>
    <div class="col-md-6">
      <table id="server-side-table" class="display">
      </table>
    </div>
  </div>
</div>

<div class="container table-container">
  <div class="row">
    <div class="col-md-8 col-md-offset-2">
      <table id="static-table" class="display">
        <thead>
          <tr>
            <th>Column1</th>
            <th>Column2</th>
            <th>Column3</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Data11</td>
            <td>Data12</td>
            <td>Data13</td>
          </tr>
          <tr>
            <td>Data21</td>
            <td>Data22</td>
            <td>Data23</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>

