       if (typeof error === "object" && error !== null) {
          try {
            errorMessage = DevToolsUtils.callPropertyOnObject(error, "toString");
          } catch (e) {
            // If the debuggee is not allowed to access the "toString" property
            // of the error object, calling this property from the debuggee's
            // compartment will fail. The debugger should show the error object
            // as it is seen by the debuggee, so this behavior is correct.
            //
            // Unfortunately, we have at least one test that assumes calling the
            // "toString" property of an error object will succeed if the
            // debugger is allowed to access it, regardless of whether the
            // debuggee is allowed to access it or not.
            //
            // To accomodate these tests, if calling the "toString" property
            // from the debuggee compartment fails, we rewrap the error object
            // in the debugger's compartment, and then call the "toString"
            // property from there.
            if (typeof error.unsafeDereference === "function") {
              errorMessage = error.unsafeDereference().toString();
            }
          }
        }

        // It is possible that we won't have permission to unwrap an
        // object and retrieve its errorMessageName.
        try {
          errorDocURL = ErrorDocs.GetURL(error);
        } catch (ex) {
          // ignored
        }

        try {
          const line = error.errorLineNumber;
          const column = error.errorColumnNumber;

          if (typeof line === "number" && typeof column === "number") {
            // Set frame only if we have line/column numbers.
            frame = {
              source: "debugger eval code",
              line,
              column
            };
          }
        } catch (ex) {
          // ignored
        }

        try {
          const notes = error.errorNotes;
          if (notes && notes.length) {
            errorNotes = [];
            for (const note of notes) {
              errorNotes.push({
                messageBody: this._createStringGrip(note.message),
                frame: {
                  source: note.fileName,
                  line: note.lineNumber,
                  column: note.columnNumber,
                }
              });
            }
          }
        } catch (ex) {
          // ignored
        }
      }
    }

    // If a value is encountered that the debugger server doesn't support yet,
    // the console should remain functional.
    let resultGrip;
    try {
      resultGrip = this.createValueGrip(result);
    } catch (e) {
      errorMessage = e;
    }

    this._lastConsoleInputEvaluation = result;

    return {
      from: this.actorID,
      input: input,
      result: resultGrip,
      timestamp: timestamp,
      exception: errorGrip,
      exceptionMessage: this._createStringGrip(errorMessage),
      exceptionDocURL: errorDocURL,
      frame,
      helperResult: helperResult,
      notes: errorNotes,
    };
  },

  /**
   * The Autocomplete request handler.
   *
   * @param object request
   *        The request message - what input to autocomplete.
   * @return object
   *         The response message - matched properties.
   */
  autocomplete: function(request) {
   