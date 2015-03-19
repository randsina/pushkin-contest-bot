require 'rails_helper'

RSpec.describe ContestsController, type: :controller do
  describe "POST #quiz" do
    it "responds successfully with an HTTP 200 status code" do
      post :quiz, {"question"=>"вн йвиюЧт ю о тс яау астчес  ьс ро", "id"=>191623, "level"=>8}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'level 1' do
    let(:level) { 1 }
    it 'should solve it' do
      question = 'Сребрит мороз увянувшее поле'
      expect(controller.send(:get_result, level, question)).to eq('19 октября')
    end
  end

  describe 'level 2' do
    let(:level) { 2 }
    it 'should solve it' do
      question = 'Сребрит мороз %WORD% поле'
      expect(controller.send(:get_result, level, question)).to eq('увянувшее')
    end

    it 'should solve it' do
      question  = 'Быть %WORD% — хорошо, спокойным — лучше вдвое'
      expect(controller.send(:get_result, level, question)).to eq('славным')
    end

    it 'should solve it' do
      question  = 'Ты приближаешься к %WORD% поре'
      expect(controller.send(:get_result, level, question)).to eq('сомнительной')
    end

    it 'should solve it' do
      question  = "     Живые %WORD%"
      expect(controller.send(:get_result, level, question)).to eq('впечатленья')
    end
  end

  describe 'level 3' do
    let(:level) { 3 }
    it 'should solve it' do
      question = "Сребрит мороз %WORD% поле,\nПроглянет день %WORD% будто поневоле"
      expect(controller.send(:get_result, level, question)).to eq('увянувшее,как')
    end
  end

  describe 'level 4' do
    let(:level) { 4 }
    it 'should solve it' do
      question = "Сребрит мороз %WORD% поле,\nПроглянет день %WORD% будто поневоле\nИ скроется за край %WORD% гор."
      expect(controller.send(:get_result, level, question)).to eq('увянувшее,как,окружных')
    end
  end

  describe 'level 5' do
    let(:level) { 5 }
    it 'should solve it' do
      question = "В споров сияньи исчезает"
      expect(controller.send(:get_result, level, question)).to eq('ее,споров')
    end

    it 'should solve it' do
      question = "Вздыхал сижу царствии небес"
      expect(controller.send(:get_result, level, question)).to eq('о,сижу')
    end
  end

  describe 'level 6' do
    let(:level) { 6 }
    it 'should solve it' do
      question = 'неМ гвра пдслийеон усажнлирт'
      expect(controller.send(:get_result, level, question)).to eq('мне враг последний журналист')
    end

    it 'should solve it' do
      question = 'хА дьласмто не диипторх овнвь'
      expect(controller.send(:get_result, level, question)).to eq('ах младость не приходит вновь')
    end

    it 'should solve it' do
      question = 'оПсетьлртя из таотпсиел'
      expect(controller.send(:get_result, level, question)).to eq('пострелять из пистолета')
    end
  end

  describe 'level 7' do
    let(:level) { 7 }
    it 'should solve it' do
      question = 'ре л оогзикаИмтфчиреа б'
      expect(controller.send(:get_result, level, question)).to eq('и облачком зефир играет')
    end

    it 'should solve it' do
      question = ' и Весогсдние инооум'
      expect(controller.send(:get_result, level, question)).to eq('в мои осенние досуги')
    end

    it 'should solve it' do
      question = 'дау озаклочвавдя нсХй ы нлв'
      expect(controller.send(:get_result, level, question)).to eq('хвала для вас докучный звон')
    end
  end

  describe 'level 8' do
    let(:level) { 8 }
    it 'should solve it' do
      question = 'б лкюл ухяйювсюоо зЯ'
      expect(controller.send(:get_result, level, question)).to eq('я люблю свою хозяйку')
    end

    it 'should solve it' do
      question = 'тбц ры ди гаИв есее'
      expect(controller.send(:get_result, level, question)).to eq('и ты в беседе граций')
    end

    it 'should solve it' do
      question = ' увЧпркобойе а еейр кн оя   вы'
      expect(controller.send(:get_result, level, question)).to eq('черной буркой ее покрывая')
    end

    it 'should solve it' do
      question = 'вн йвиюЧт ю о тс яау астчес  ьс ро'
      expect(controller.send(:get_result, level, question)).to eq('что с участью твоей сравнится')
    end
  end
end
