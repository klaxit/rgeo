/*
  Analysis methos for GEOS wrapper
*/

#include "preface.h"

#ifdef RGEO_GEOS_SUPPORTED

#include <ruby.h>
#include <geos_c.h>

#include "analysis.h"
#include "factory.h"
#include "errors.h"

RGEO_BEGIN_C

/*
 * call-seq:
 *   RGeo::Geos::Analysis.ccw? -> true or false
 *
 * Checks direction for a ring, returns +true+ if counter-clockwise, +false+
 * otherwise.
 */
VALUE rgeo_geos_analysis_ccw_p(VALUE self, VALUE ring)
{
  const RGeo_GeometryData* ring_data;
  const GEOSCoordSequence* coord_seq;
  char is_ccw;

  rgeo_check_geos_object(ring);

  ring_data = RGEO_GEOMETRY_DATA_PTR(ring);

  coord_seq = GEOSGeom_getCoordSeq_r(ring_data->geos_context, ring_data->geom);
  if (!coord_seq) { rb_raise(geos_error, "Could not retrieve CoordSeq from given ring."); }
  if (!GEOSCoordSeq_isCCW_r(ring_data->geos_context, coord_seq, &is_ccw)) {
    rb_raise(geos_error, "Could not determine if the CoordSeq is CCW.");
  }

  return is_ccw ? Qtrue : Qfalse;
};


void rgeo_init_geos_analysis(RGeo_Globals* globals)
{
  VALUE geos_analysis_module;

  geos_analysis_module = rb_define_module_under(globals->geos_module, "Analysis");
  rb_define_singleton_method(geos_analysis_module, "ccw?", rgeo_geos_analysis_ccw_p, 1);
}

RGEO_END_C

#endif