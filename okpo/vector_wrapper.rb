# frozen_string_literal: true

require 'matrix'
require 'pry'

class VectorWrapper
  attr_reader :first, :second, :operation, :state

  OPERATION_MAPPING = {
    '+' => 'add',
    '-' => 'subtract',
    '*' => 'multiply',
    '/' => 'divide'
  }.freeze

  ALLOWED_OPERATIONS = OPERATION_MAPPING.keys

  def call
    puts state[:message]
    send("#{OPERATION_MAPPING[operation]}") unless state[:status].zero?
  end

  private

  def init_argument(arg)
    arg.is_a?(Array) ? init_vector(arg) : arg
  end

  def init_vector(arr)
    Vector::elements(arr)
  end

  def initialize(first:, second:, operation:)
    @first = init_argument(first)
    @second = init_argument(second)
    @operation = operation
    @state = {
      status: 1,
      message: 'Well done!'
    }
    check_correspondence
  end

  def check_correspondence
    if operation.nil? || (%w(* /).include?(operation) && second.is_a?(Vector))
      @state = {
        status: 0,
        message: 'Wrong conditions'
      }
    end
  end

  def add
    first + second
  end

  def subtract
    first - second
  end

  def multiply
    first * second
  end

  def divide
    first / second
  end
end