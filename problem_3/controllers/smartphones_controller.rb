# frozen_string_literal: true

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
