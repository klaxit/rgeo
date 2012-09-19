# -----------------------------------------------------------------------------
#
# A container file for one-off tests
#
# -----------------------------------------------------------------------------
# Copyright 2010-2012 Daniel Azuma
#
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice,
#   this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
# * Neither the name of the copyright holder, nor the names of any other
#   contributors to this software, may be used to endorse or promote products
#   derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
# -----------------------------------------------------------------------------
;


require 'test/unit'
require 'rgeo'
require 'ffi-geos'


module RGeo
  module Tests  # :nodoc:

    class TestOneOff < ::Test::Unit::TestCase  # :nodoc:


      def setup
        # @mercator_factory = ::RGeo::Geographic.simple_mercator_factory
        # @spherical_factory = ::RGeo::Geographic.spherical_factory(:buffer_resolution => 2)
        # @projected_factory = ::RGeo::Geographic.projected_factory(:projection_proj4 => '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs', :projection_srid => 3857, :has_z_coordinate => true)
        # @geos_factory = ::RGeo::Geos.factory(:buffer_resolution => 2)
        # @cartesian_factory = ::RGeo::Cartesian.simple_factory(:buffer_resolution => 2)
      end


      def _test_dummy1
        f_ = ::RGeo::Geos.factory(:buffer_resolution => 2)
        p1_ = f_.polygon(f_.linear_ring([]))
        p2_ = f_.polygon(f_.linear_ring([f_.point(0, 0), f_.point(0, 1), f_.point(1, 1), f_.point(1, 0)]))
        mp_ = f_.multi_polygon([p2_, p1_])
        puts mp_.centroid.as_text
      end


    end

  end
end
