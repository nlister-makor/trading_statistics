import Autocomplete from '@material-ui/lab/Autocomplete';
import { makeStyles, TextField, withStyles, Button, IconButton, Switch } from '@material-ui/core';

export const useStyles = makeStyles((theme) => ({
    buttonRow:{
        width: "40vw",
        margin: "10vh auto 20px auto",
        justifyContent: "space-between",
       
    },
    vizContainer:{
        backgroundColor: 'var(--main)',
        minWidth: "70%",
        minHeight: "600px",
        borderRadius: "8px",
        marginTop:50,
        

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