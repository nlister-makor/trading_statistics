import React, { useState, useEffect, useRef } from 'react'
import {useStyles }from "../Styles/mainStyles";
import data from "../model_data.json";
import { Grid } from '@material-ui/core'
import BarChart from './d3/BarChart';
function VizArea() {

    const classes = useStyles();
    console.log(data.data)
    


  return (
    <Grid container className={classes.vizContainer}>
        <BarChart data={data.data}/>
    </Grid>
  )
}

export default VizArea