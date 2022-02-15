
import ButtonBar from "./Components/ButtonBar";
import VizArea from "./Components/VizArea";
import { Grid, makeStyles, Typography } from '@material-ui/core';




function App() {

  const classes = useStyles();

  return (
    <Grid container direction="column" className={classes.App}>

      <Typography className={classes.title}>Test the Server</Typography>
      <ButtonBar />
      <VizArea />
      
    </Grid>
  );
}

export default App;

const useStyles = makeStyles((theme) => ({

    App: {
        width: "85vw",
        margin: "5vh auto 0 auto",
        alignItems: "center"
        
    },
    title:{
      fontSize: 40,
      color:  'var(--main)',
      fontWeight: 600,
    },

}))