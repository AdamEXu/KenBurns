#!/usr/bin/env ruby

require 'mini_magick'
require 'optparse'

# Parse options
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: resize.rb [options] directory"
  opts.on("-w", "--width WIDTH", Integer, "Width to which the images should be resized. If not provided, the largest image width in the folder will be used.") do |w|
    options[:width] = w
  end
end.parse!

# Validate directory input
abort("You must specify a directory as the input.") if ARGV.empty?
directory = ARGV[0]
abort("The specified directory does not exist.") unless Dir.exist?(directory)

# Determine the largest width among the images
def find_largest_width(directory)
  largest_width = 0
  Dir.glob(File.join(directory, "*.{jpg,jpeg,png,gif}")).each do |image_file|
    image = MiniMagick::Image.open(image_file)
    largest_width = [largest_width, image.width].max
  end
  largest_width
end

# Set default width to the largest image width if not specified
unless options[:width]
  largest_width = find_largest_width(directory)
  options[:width] = largest_width
  puts "Resizing images to the largest width found: #{largest_width}px"
end

# Function to resize image
def resize_image(file, width)
  image = MiniMagick::Image.open(file)
  original_width = image[:width]
  original_height = image[:height]
  new_height = (original_height.to_f / original_width) * width
  image.resize "#{width}x#{new_height.to_i}"
  image.write file
end

# Process each image in the hand directory
Dir.glob(File.join(directory, "*.{jpg,jpeg,png,gif}")).each do |image_file|
  puts "Resizing #{image_file}"
  resize_image(image_file, options[:width])
end

puts "All images have been resized."
