class CreateAreaSexuals < ActiveRecord::Migration
  def change
    create_table :area_sexuals do |t|
      t.text :observaciones
      t.string :activoSexual
      t.integer :edadActivoSexual
      t.text :frecuenciaActividadSexual
      t.string :onanismo
      t.integer :edadOnanismo
      t.text :frecuenciaOnanismo
      t.belongs_to :paciente, index:true
      t.text :orientacionSexual
      t.text :primeraExperiencia

      t.timestamps null: false
    end
  end
end
