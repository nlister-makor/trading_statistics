import Autocomplete from '@material-ui/lab/Autocomplete';
import { makeStyles, TextField, withStyles, Button, IconButton, Switch } from '@material-ui/core';

export const useStyles = makeStyles((theme) => ({
    buttonRow:{
        width: "40vw",
        margin: "10vh auto 20px auto",
        justifyContent: "space-evenly",
               
    },
    vizContainer:{
        backgroundColor: 'var(--main)',
        width: "100%",
        height: "700px",
        borderRadius: "8px",
        marginTop:50,
        overflowX: "auto",
        overflowY: "hidden"

        

    }

}))

export const FilledButton = withStyles({
    root: {
      padding: '7px 39px',
      backgroundColor: 'var(--secondary)',
      fontWeight: 600,
      fontSize: '18px',
      color: '#FFFFFF',
      borderRadius: '21px',
      textTransform: 'none',
      '&:hover': {
        backgroundColor: 'var(--secondaryDark)',
        boxShadow: '0px 6px 10px #00185829',
        transition: '.3s',
      },
      '&.Mui-disabled': {
        backgroundColor: '#ACB1BF',
        color: '#868DA2',
      },
    },
  })(Button);