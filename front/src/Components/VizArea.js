import React, { useState, useEffect, useRef } from 'react'
import {useStyles }from "../Styles/mainStyles";
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

  return (
    <Grid container className={classes.vizContainer}>
        
    </Grid>
  )
}

export default VizArea