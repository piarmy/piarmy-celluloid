#!/usr/bin/env ruby

require 'dcell/explorer'

DCell::Explorer.supervise("0.0.0.0", 8000)
