
import React, { useState, useCallback, useEffect } from 'react';
import { scaleBand, scaleLinear, max, format } from 'd3';
import AxisBottom  from './barchart/AxisBottom';
import AxisLeft  from './barchart/AxisLeft';
import Marks  from './barchart/Marks';

const width = 800;
const height = 600;
const margin = { top: 20, right: 30, bottom: 65, left: 30 };
const xAxisLabelOffset = 50;


function BarChart({ data }) {
  
  if (!data) {
    return <pre>Loading...</pre>;
  }

    const innerHeight = height - margin.top - margin.bottom;
    const innerWidth = width - margin.left - margin.right;

    const yValue = d => d.time;
    const xValue = d => d.Test;

    const siFormat = format('.2s');
    const yAxisTickFormat = tickValue => siFormat(tickValue);

    const xScale = scaleBand()
      .domain(data.map(xValue))
      .range([0, innerWidth])
      .paddingInner(0.15);

    const yScale = scaleLinear()
      .domain([0, max(data, yValue)])
      .range([0, innerHeight]);

  return (
    <svg width={width} height={height}>
      <g transform={`translate(${margin.left},${margin.top})`}>
        <AxisBottom
          xScale={xScale}
          innerHeight={innerHeight}
          
        />
        <AxisLeft 
          yScale={yScale}
          tickFormat={yAxisTickFormat}
          />
        <text
          className="axis-label"
          x={innerWidth / 2}
          y={innerHeight + xAxisLabelOffset}
          textAnchor="middle"
        >
          Population
        </text>
        <Marks
          data={data}
          xScale={xScale}
          yScale={yScale}
          xValue={xValue}
          yValue={yValue}
          tooltipFormat={yAxisTickFormat}
        />
      </g>
    </svg>
  )
}

export default BarChart