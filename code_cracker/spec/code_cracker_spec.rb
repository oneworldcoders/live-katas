require 'rubygems'
require 'rspec'
require_relative '../lib/code_cracker'

describe CodeCracker do
  code_cracker = CodeCracker.new
  alphabets = 'abcdefghijklmnopqrstuvwxyz'
  keys = '!)"(£*%&><@abcdefghijklmno'
  describe '#encrypt' do
    it 'encrypt dad to (!(' do
      expect(code_cracker.encrypt('dad')).to eq('(!(')
    end
    it 'encrypt hello to &£aad' do
      expect(code_cracker.encrypt('hello')).to eq('&£aad')
    end
    it 'encrypt hello dad to &£aad(!( by removing space' do
      expect(code_cracker.encrypt('hello dad')).to eq('&£aad(!(')
    end
    it 'encrypt all alphabets with their corresponding keys' do
      expect(code_cracker.encrypt(alphabets)).to eq(keys)
    end
  end
  describe '#decrypt' do
    it 'decrypt (!( to dad' do
      expect(code_cracker.decrypt('(!(')).to eq('dad')
    end
    it 'decrypt &£aad to hello' do
      expect(code_cracker.decrypt('&£aad')).to eq('hello')
    end
    it 'decrypt all keys to their corresponding alphabets' do
      expect(code_cracker.decrypt(keys)).to eq(alphabets)
    end
  end
end
