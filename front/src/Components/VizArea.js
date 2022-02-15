import React, { useState, useEffect, useRef } from 'react'
import {useStyles }from "../Styles/mainStyles";
import data from "../model_data.json";
import {
  Grid,
  Typography,
  TextField,
  Button,
  IconButton,
  Chip,
  Divider
} from '@material-ui/core'
function VizArea() {

    const classes = useStyles();
    console.log(data)

   
    


  return (
    <Grid container className={classes.vizContainer}>
        
    </Grid>
  )
}

export default VizArea