### This solution assumes that [Rails framework](https://rubyonrails.org/) can be used.

# config/routes.rb
Rails.application.routes.draw do
  resources :smartphones, only: [:create]
end

# app/models/smartphone.rb
class Smartphone < ApplicationRecord
  belongs_to :model
  belongs_to :color

  validates :storage_capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :year_of_manufacture, presence: true, numericality: { only_integer: true }
  validates :os_version, presence: true
  validates :acquisition_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :selling_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :imei_number, presence: true, uniqueness: true, format: { with: /\A\d{15}\z/, message: "must be 15 digits" }

  validate :year_not_in_future

  private

  def year_not_in_future
    if year_of_manufacture.present? && year_of_manufacture > Date.current.year
      errors.add(:year_of_manufacture, "cannot be in the future")
    end
  end
end


# app/controllers/smartphones_controller.rb
module SmartphoneInventory
  class SmartphonesController < ApplicationController
    def new
      @smartphone = Smartphone.new

      render :new, locals: {
        smartphone: @smartphone
      }
    end

    def create
      @smartphone = Smartphone.new(smartphone_params)

      if @smartphone.save
        respond_to do |format|
          format.json { render json: @smartphone.as_json }
          format.html { redirect_to smartphones_path, notice: "Smartphone was successfully registered." }
        end
      else
        respond_to do |format|
          format.json { render json: { errors: @smartphone.errors }, status: :unprocessable_entity }
          format.html { render :new, locals: { smartphone: @smartphone }, status: :unprocessable_entity }
        end
      end
    end

    private

    def smartphone_params
      params.require(:smartphone).permit(
        :model_id,
        :storage_capacity,
        :year_of_manufacture,
        :os_version,
        :color_id,
        :acquisition_date,
        :acquisition_price,
        :selling_price,
        :imei_number,
        :status,
        :condition_notes
      )
    end
  end
end
