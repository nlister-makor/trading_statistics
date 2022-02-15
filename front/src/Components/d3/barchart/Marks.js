import React from 'react'

function Marks({data,xScale,yScale,xValue,yValue,tooltipFormat, innerHeight}) {
  return (
    <>
        {
            data.map(d => (
                <rect
                className="mark"
                key={yValue(d)}
                x={xScale(xValue(d))}
                y={yScale(yValue(d))}
                //width={xScale(xValue(d))}
                width={xScale.bandwidth()}
                height={innerHeight - yScale(yValue(d))}
                fill="var(--secondary)"
                >
                <title>{d.name} {d.side} {d.type} {Math.round(d.time*1000)}ms</title>
            </rect>
            ))}
    </>
  )
}

export default Marks