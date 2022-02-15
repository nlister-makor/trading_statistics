
import React, { useState, useCallback, useEffect } from 'react';
import { scaleBand, scaleLinear, max, format } from 'd3';
import { AxisBottom } from './barchart/AxisBottom';
import { AxisLeft } from './barchart/AxisLeft';
import { Marks } from './barchart/Marks';

const width = 800;
const height = 600;
const margin = { top: 20, right: 30, bottom: 65, left: 220 };
const xAxisLabelOffset = 50;
function BarChart() {

  return (
    <div>BarChart</div>
  )
}

export default BarChart